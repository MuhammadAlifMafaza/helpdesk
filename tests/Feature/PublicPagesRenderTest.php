<?php

namespace Tests\Feature;

use Tests\TestCase;

class PublicPagesRenderTest extends TestCase
{
    public function test_tamu_dapat_membuka_landing_page(): void
    {
        $this->withoutVite()
            ->get('/')
            ->assertOk()
            ->assertSee('HELPDESK IWIMA')
            ->assertSee('Dukungan teknologi kampus, lewat satu portal.')
            ->assertSee('0');
    }

    public function test_tamu_dapat_membuka_form_login(): void
    {
        $this->withoutVite()
            ->get('/login')
            ->assertOk()
            ->assertSee('Masuk ke Helpdesk')
            ->assertSee('Alamat email')
            ->assertSee('Kata sandi')
            ->assertSee('Lupa kata sandi?');
    }
}
