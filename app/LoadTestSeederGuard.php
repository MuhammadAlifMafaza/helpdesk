<?php

namespace App;

use InvalidArgumentException;

class LoadTestSeederGuard
{
    public static function assertSafeTarget(): void
    {
        if (! app()->environment(['local', 'testing'])) {
            throw new InvalidArgumentException('Load test data can only be seeded in local or testing environments.');
        }

    }
}
