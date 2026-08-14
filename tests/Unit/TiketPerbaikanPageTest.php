<?php

namespace Tests\Unit;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\CreateTiketPerbaikan;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Schemas\TiketPerbaikanForm;
use Filament\Forms\Components\Select;
use ReflectionMethod;
use Tests\TestCase;

class TiketPerbaikanPageTest extends TestCase
{
    public function test_create_page_mutate_form_data_method_matches_filament_signature(): void
    {
        $method = new ReflectionMethod(CreateTiketPerbaikan::class, 'mutateFormDataBeforeCreate');

        $this->assertFalse($method->isStatic());
        $this->assertSame('array', (string) $method->getReturnType());
    }

    public function test_ticket_ownership_options_match_database_enum(): void
    {
        $schema = TiketPerbaikanForm::configure(new \Filament\Schemas\Schema());

        $components = $schema->getComponents();
        $ownership = collect($components)->first(fn ($component) => $component instanceof Select && $component->getName() === 'kepemilikan');

        $this->assertNotNull($ownership);
        $this->assertSame([
            'Inventaris Kantor' => 'Inventaris Kantor',
            'Pribadi' => 'Pribadi',
            'Lainnya' => 'Lainnya',
        ], $ownership->getOptions());
    }
}
