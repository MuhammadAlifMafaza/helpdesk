import ws from 'k6/ws';
import { check } from 'k6';

const wsUrl = __ENV.REVERB_WS_URL || 'ws://127.0.0.1:8080';
const appKey = __ENV.REVERB_APP_KEY;
const maxVus = Number.parseInt(__ENV.MAX_VUS || '50', 10);
const isSmokeTest = __ENV.LOAD_TEST_SMOKE === '1';
const testDuration = isSmokeTest ? '5s' : '2m';
const connectionDurationMs = isSmokeTest ? 8000 : 125000;
const targetMatch = wsUrl.match(/^wss?:\/\/([^/:]+|\[[^\]]+\])(?::\d+)?(?:\/|$)/i);
const targetHost = targetMatch ? targetMatch[1].toLowerCase() : '';
const isLocalTarget = ['localhost', '127.0.0.1', '[::1]'].includes(targetHost)
    || targetHost.endsWith('.test')
    || targetHost.endsWith('.localhost');

if (!isLocalTarget) {
    throw new Error('Stress test WebSocket dibatasi untuk host lokal.');
}

if (!appKey) {
    throw new Error('REVERB_APP_KEY wajib menggunakan key sintetis database uji.');
}

if (!Number.isInteger(maxVus) || maxVus < 1 || maxVus > 50) {
    throw new Error('MAX_VUS harus berupa bilangan bulat dari 1 sampai 50.');
}

export const options = {
    scenarios: {
        reverb_connections: {
            executor: 'constant-vus',
            vus: isSmokeTest ? 1 : maxVus,
            duration: testDuration,
            gracefulStop: '10s',
        },
    },
    thresholds: {
        ws_connecting: ['p(95)<1000'],
        ws_sessions: ['count>0'],
    },
};

export default function () {
    let established = false;
    const url = `${wsUrl.replace(/\/$/, '')}/app/${encodeURIComponent(appKey)}?protocol=7&client=js&version=8.6.0&flash=false`;
    const response = ws.connect(url, null, (socket) => {
        socket.on('message', (message) => {
            try {
                const payload = JSON.parse(message);
                if (payload.event === 'pusher:connection_established') {
                    established = true;
                }
            } catch {
                // Ignore protocol frames that are not JSON events.
            }
        });

        socket.on('open', () => {
            socket.setTimeout(() => socket.close(), connectionDurationMs);
        });
    });

    check(response, {
        'Reverb WebSocket handshake upgraded': (result) => result && result.status === 101,
    });
    check(established, {
        'Reverb Pusher protocol established': (result) => result === true,
    });
}
