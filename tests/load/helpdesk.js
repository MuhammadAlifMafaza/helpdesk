import http from 'k6/http';
import { check, sleep } from 'k6';

const baseUrl = (__ENV.BASE_URL || 'http://127.0.0.1:8000').replace(/\/$/, '');
const maxVus = Number.parseInt(__ENV.MAX_VUS || '50', 10);
const isSmokeTest = __ENV.LOAD_TEST_SMOKE === '1';
const auditMarker = (__ENV.AUDIT_MARKER || 'AUDIT-PERF').replace(/[^a-zA-Z0-9-]/g, '');
const targetMatch = baseUrl.match(/^https?:\/\/([^/:]+|\[[^\]]+\])(?::\d+)?(?:\/|$)/i);
const targetHost = targetMatch ? targetMatch[1].toLowerCase() : '';
const isLocalTarget = ['localhost', '127.0.0.1', '[::1]'].includes(targetHost)
    || targetHost.endsWith('.test')
    || targetHost.endsWith('.localhost');

if (!isLocalTarget) {
    throw new Error('Stress test dibatasi untuk host lokal (localhost, loopback, atau domain .test).');
}

if (!Number.isInteger(maxVus) || maxVus < 1 || maxVus > 75) {
    throw new Error('MAX_VUS harus berupa bilangan bulat dari 1 sampai 75.');
}

const pemohonEmail = __ENV.PEMOHON_EMAIL;
const pemohonPassword = __ENV.PEMOHON_PASSWORD;
const adminEmail = __ENV.ADMIN_EMAIL;
const adminPassword = __ENV.ADMIN_PASSWORD;
const ruanganId = __ENV.LOAD_TEST_RUANGAN_ID || '1';
const kategoriId = __ENV.LOAD_TEST_KATEGORI_ID || '1';
const exampleProductUrl = __ENV.LOAD_TEST_PRODUCT_URL
    || 'https://www.tokopedia.com/search?st=product&q=access%20point%20wi-fi%206';

if (!pemohonEmail || !pemohonPassword || !adminEmail || !adminPassword) {
    throw new Error('PEMOHON_EMAIL, PEMOHON_PASSWORD, ADMIN_EMAIL, dan ADMIN_PASSWORD wajib memakai akun lokal yang sudah diverifikasi.');
}

const stages = isSmokeTest
    ? [{ duration: '1s', target: 1 }]
    : [
        { duration: '20s', target: 1 },
        { duration: '30s', target: Math.min(10, maxVus) },
        { duration: '30s', target: Math.min(25, maxVus) },
        { duration: '30s', target: Math.min(50, maxVus) },
        { duration: '30s', target: Math.min(60, maxVus) },
        { duration: '30s', target: Math.min(70, maxVus) },
        { duration: '30s', target: maxVus },
        { duration: '2m', target: maxVus },
        { duration: '30s', target: 0 },
    ];

export const options = {
    scenarios: {
        helpdesk_user_journey: {
            executor: 'ramping-vus',
            startVUs: 1,
            stages,
            gracefulRampDown: '30s',
        },
    },
    thresholds: {
        checks: ['rate>0.99'],
        http_req_failed: ['rate<0.01'],
        http_req_duration: ['p(95)<2000'],
    },
    discardResponseBodies: false,
};

function checkResponse(response, name, expectedStatus = 200) {
    check(response, {
        [name]: (result) => result.status === expectedStatus,
    });
}

function getCsrfToken(html) {
    const tokenInput = html.match(/<input[^>]*name="_token"[^>]*value="([^"]+)"/i);

    if (tokenInput) {
        return tokenInput[1];
    }

    const tokenMeta = html.match(/<meta[^>]*name="csrf-token"[^>]*content="([^"]+)"/i);

    return tokenMeta ? tokenMeta[1] : null;
}

function decodeHtmlAttribute(value) {
    return value
        .replace(/&quot;/g, '"')
        .replace(/&#039;/g, "'")
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>')
        .replace(/&amp;/g, '&');
}

function getLivewireSnapshot(html, componentName) {
    const matches = html.matchAll(/wire:snapshot="([^"]+)"/gi);

    for (const match of matches) {
        const encodedSnapshot = decodeHtmlAttribute(match[1]);
        let parsedSnapshot;

        try {
            parsedSnapshot = JSON.parse(encodedSnapshot);
        } catch {
            continue;
        }

        if (parsedSnapshot?.memo?.name?.endsWith(componentName)) {
            return encodedSnapshot;
        }
    }

    return null;
}

function getLivewireUpdateUrl(html) {
    const match = html.match(/data-update-uri="([^"]+)"/i);

    if (!match) {
        return null;
    }

    return match[1]
        .replace(/&amp;/g, '&')
        .replace(/&quot;/g, '"');
}

function callLivewire(updateUrl, snapshot, csrfToken, updates, method, journey, params = []) {
    const response = http.post(updateUrl, JSON.stringify({
        _token: csrfToken,
        components: [{
            snapshot,
            updates,
            calls: [{ method, params, metadata: {} }],
        }],
    }), {
        headers: {
            'Content-Type': 'application/json',
            'X-Livewire': '1',
        },
        tags: { journey },
    });

    checkResponse(response, `${journey} completes successfully`);

    let payload;
    try {
        payload = response.json();
    } catch {
        check(null, { [`${journey} returns Livewire JSON`]: () => false });
        return null;
    }

    const component = payload?.components?.[0];
    check(component, { [`${journey} returns a component response`]: (value) => Boolean(value) });

    return component || null;
}

function createRecord(path, csrfToken, updates, method, journey, detailPrefix, componentName) {
    const formPage = http.get(`${baseUrl}${path}`, { tags: { journey: `${journey}_form` } });
    checkResponse(formPage, `${journey} form responds successfully`);

    const snapshot = getLivewireSnapshot(formPage.body || '', componentName);
    const updateUrl = getLivewireUpdateUrl(formPage.body || '');
    const formCsrfToken = getCsrfToken(formPage.body || '') || csrfToken;
    check(snapshot, { [`${journey} form contains Livewire snapshot`]: (value) => Boolean(value) });

    if (!snapshot || !updateUrl) {
        return null;
    }

    const component = callLivewire(updateUrl, snapshot, formCsrfToken, updates, method, journey);
    const redirect = component?.effects?.redirect;
    const recordPathMatch = typeof redirect === 'string'
        ? redirect.match(new RegExp(`${detailPrefix}/(\\d+)`))
        : null;

    check(recordPathMatch, { [`${journey} redirects to a saved record`]: (value) => Boolean(value) });

    return recordPathMatch ? recordPathMatch[1] : null;
}

function sendChatMessage(path, csrfToken, message, journey, componentName) {
    const detailPage = http.get(`${baseUrl}${path}`, { tags: { journey: `${journey}_detail` } });
    checkResponse(detailPage, `${journey} detail responds successfully`);

    const snapshot = getLivewireSnapshot(detailPage.body || '', componentName);
    const updateUrl = getLivewireUpdateUrl(detailPage.body || '');
    const detailCsrfToken = getCsrfToken(detailPage.body || '') || csrfToken;
    check(snapshot, { [`${journey} detail contains Livewire snapshot`]: (value) => Boolean(value) });

    if (snapshot && updateUrl) {
        callLivewire(updateUrl, snapshot, detailCsrfToken, { chatMessage: message }, 'sendChatMessage', `${journey}_chat`);
    }
}

function loginAsAdmin(csrfToken) {
    const applicantDashboard = http.get(`${baseUrl}/pemohon`, { tags: { journey: 'applicant_pre_logout' } });
    checkResponse(applicantDashboard, 'applicant dashboard responds before logout');

    const currentCsrfToken = getCsrfToken(applicantDashboard.body || '') || csrfToken;
    const logoutBody = `_token=${encodeURIComponent(currentCsrfToken)}`;
    const logoutResponse = http.post(`${baseUrl}/logout`, logoutBody, {
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        redirects: 5,
        tags: { journey: 'applicant_logout' },
    });
    checkResponse(logoutResponse, 'applicant logout succeeds');
    check(logoutResponse, { 'applicant logout returns to login': (response) => response.url.endsWith('/login') });

    const loginPage = http.get(`${baseUrl}/admin/login`, { tags: { journey: 'admin_login_page' } });
    checkResponse(loginPage, 'admin login page responds successfully');

    const snapshot = getLivewireSnapshot(loginPage.body || '', 'Login');
    const updateUrl = getLivewireUpdateUrl(loginPage.body || '');
    const adminCsrfToken = getCsrfToken(loginPage.body || '') || csrfToken;
    check(snapshot, { 'admin login page contains Livewire snapshot': (value) => Boolean(value) });

    if (!snapshot || !updateUrl) {
        return null;
    }

    const component = callLivewire(
        updateUrl,
        snapshot,
        adminCsrfToken,
        {
            'data.identifier': adminEmail,
            'data.password': adminPassword,
        },
        'authenticate',
        'admin_login_submit',
    );
    const redirect = component?.effects?.redirect;
    check(redirect, { 'admin login redirects to its panel': (value) => typeof value === 'string' && value.includes('/admin') });

    return adminCsrfToken;
}

function moveRecordToInProgress(path, componentName, csrfToken, journey) {
    const detailPage = http.get(`${baseUrl}${path}`, { tags: { journey: `${journey}_detail` } });
    checkResponse(detailPage, `${journey} detail responds for staff`);

    const snapshot = getLivewireSnapshot(detailPage.body || '', componentName);
    const updateUrl = getLivewireUpdateUrl(detailPage.body || '');
    const detailCsrfToken = getCsrfToken(detailPage.body || '') || csrfToken;
    check(snapshot, { [`${journey} detail contains staff Livewire component`]: (value) => Boolean(value) });

    if (!snapshot || !updateUrl) {
        return;
    }

    callLivewire(
        updateUrl,
        snapshot,
        detailCsrfToken,
        {},
        'mountAction',
        `${journey}_assign`,
        ['ambil_tiket'],
    );

    const updatedPage = http.get(`${baseUrl}${path}`, { tags: { journey: `${journey}_status_check` } });
    checkResponse(updatedPage, `${journey} updated detail responds successfully`);
    check(updatedPage, { [`${journey} status moves to in progress`]: (response) => response.body.includes('In Progress') });
}

export default function () {
    const publicPage = http.get(`${baseUrl}/`, { tags: { journey: 'public_landing' } });
    checkResponse(publicPage, 'landing page responds successfully');

    const loginPage = http.get(`${baseUrl}/login`, { tags: { journey: 'login_page' } });
    checkResponse(loginPage, 'login page responds successfully');

    const csrfToken = getCsrfToken(loginPage.body || '');
    check(csrfToken, { 'login page contains CSRF token': (token) => Boolean(token) });

    if (!csrfToken) {
        return;
    }

    const loginBody = [
        `_token=${encodeURIComponent(csrfToken)}`,
        `email=${encodeURIComponent(pemohonEmail)}`,
        `password=${encodeURIComponent(pemohonPassword)}`,
    ].join('&');
    const loginResponse = http.post(`${baseUrl}/login`, loginBody, {
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        redirects: 5,
        tags: { journey: 'login_submit' },
    });
    checkResponse(loginResponse, 'pemohon login succeeds');
    check(loginResponse, { 'login redirects into the pemohon panel': (response) => response.url.includes('/pemohon') });

    const protectedPages = [
        ['/pemohon', 'pemohon_dashboard'],
        ['/pemohon/ticket-perbaikan', 'ticket_list'],
        ['/pemohon/pengajuan-barang', 'request_list'],
    ];

    for (const [path, journey] of protectedPages) {
        const response = http.get(`${baseUrl}${path}`, { tags: { journey } });
        checkResponse(response, `${journey} responds successfully`);
    }

    const uniqueSuffix = `${auditMarker}-${__VU}-${__ITER}-${Date.now()}`;
    const ticketId = createRecord(
        '/pemohon/ticket-perbaikan/create',
        csrfToken,
        {
            'data.ruangan_id': ruanganId,
            'data.kepemilikan': 'Inventaris Kantor',
            'data.keluhan': `${uniqueSuffix}: PC ruang kuliah tidak terhubung ke jaringan.`,
            'data.deskripsi': `Simulasi audit performa. Perangkat di ruang kuliah memerlukan pemeriksaan koneksi jaringan dan konfigurasi adaptor. Penanda data: ${uniqueSuffix}.`,
        },
        'create',
        'ticket_create',
        '/pemohon/ticket-perbaikan',
        'CreateTiketPerbaikan',
    );

    if (ticketId) {
        sendChatMessage(
            `/pemohon/ticket-perbaikan/${ticketId}`,
            csrfToken,
            `Simulasi audit performa ${uniqueSuffix}: teknisi dimohon memeriksa koneksi dan memberi pembaruan setelah pemeriksaan awal.`,
            'ticket',
            'ViewTiketPerbaikan',
        );
    }

    const requestId = createRecord(
        '/pemohon/pengajuan-barang/create',
        csrfToken,
        {
            'data.kategori_barang_id': kategoriId,
            'data.nama_barang': `${uniqueSuffix} Access point Wi-Fi 6`,
            'data.jumlah': '1',
            'data.alasan': `Simulasi audit performa untuk pengadaan access point ruang kuliah dengan cakupan perangkat yang memadai. Penanda data: ${uniqueSuffix}.`,
            'data.jenis_contoh_barang': 'tautan',
            'data.contoh_barang_url': exampleProductUrl,
        },
        'create',
        'request_create',
        '/pemohon/pengajuan-barang',
        'CreatePengajuanBarang',
    );

    if (requestId) {
        sendChatMessage(
            `/pemohon/pengajuan-barang/${requestId}`,
            csrfToken,
            `Simulasi audit performa ${uniqueSuffix}: pengajuan dicatat untuk mengukur alur komunikasi dan pembaruan status.`,
            'request',
            'ViewPengajuanBarang',
        );
    }

    const adminCsrfToken = loginAsAdmin(csrfToken);
    if (adminCsrfToken) {
        const staffPages = [
            ['/admin', 'admin_dashboard'],
            ['/admin/ticket-services', 'admin_ticket_list'],
            ['/admin/pengajuan-barang', 'admin_request_list'],
            ['/admin/Laporan-Perbaikan', 'admin_ticket_report'],
            ['/admin/Laporan-Permintaan-Barang', 'admin_request_report'],
        ];

        for (const [path, journey] of staffPages) {
            const response = http.get(`${baseUrl}${path}`, { tags: { journey } });
            checkResponse(response, `${journey} responds successfully`);
        }

        if (ticketId) {
            moveRecordToInProgress(
                `/admin/ticket-services/${ticketId}`,
                'ViewTicketService',
                adminCsrfToken,
                'staff_ticket',
            );
        }

        if (requestId) {
            moveRecordToInProgress(
                `/admin/pengajuan-barang/${requestId}`,
                'ViewPengajuanBarang',
                adminCsrfToken,
                'staff_request',
            );
        }
    }

    sleep(Math.random() * 0.5 + 0.25);
}
