<?php

return [
    'applicant_email' => env('LOAD_TEST_PEMOHON_EMAIL'),
    'applicant_password' => env('LOAD_TEST_PEMOHON_PASSWORD'),
    'admin_email' => env('LOAD_TEST_ADMIN_EMAIL'),
    'admin_password' => env('LOAD_TEST_ADMIN_PASSWORD'),
    'generated_password' => env('LOAD_TEST_GENERATED_PASSWORD', 'Load-Test-Only-Password!2026'),
    'users' => [
        'pemohon' => (int) env('LOAD_TEST_PEMOHON_COUNT', 1000),
        'teknisi' => (int) env('LOAD_TEST_TEKNISI_COUNT', 50),
        'admin' => (int) env('LOAD_TEST_ADMIN_COUNT', 10),
        'super_admin' => (int) env('LOAD_TEST_SUPER_ADMIN_COUNT', 1),
        'chunk_size' => (int) env('LOAD_TEST_USER_CHUNK_SIZE', 500),
    ],
    'master_ruangan_count' => (int) env('LOAD_TEST_RUANGAN_COUNT', 200),
    'master_kategori_count' => (int) env('LOAD_TEST_KATEGORI_COUNT', 50),
];
