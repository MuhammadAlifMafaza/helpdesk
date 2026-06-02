<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;

class TiketPerbaikan extends Model
{
    protected $table = 'tiket_perbaikan';

    protected $fillable = [
        'user_id',
        'ruangan_id',
        'keluhan',
        'kepemilikan',
        'deskripsi',
        'status',
        'prioritas',
    ];

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    public function ruangan()
    {
        return $this->belongsTo(
            MasterRuangan::class,
            'ruangan_id'
        );
    }

    public function logs()
    {
        return $this->hasMany(
            LogPerbaikan::class,
            'tiket_id'
        );
    }

    protected static function booted()
    {
        static::created(function ($tiket) {

            LogPerbaikan::create([
                'tiket_id' => $tiket->id,
                'user_id' => auth()->id() ?? $this->user_id,
                'kategori_log' => 'Status',
                'data_lama' => null,
                'data_baru' => 'Open',
                'keterangan' => 'Tiket dibuat',
            ]);

        });
    }

    public function tambahLog(
        string $kategori,
        ?string $lama,
        ?string $baru,
        ?string $keterangan
    ) {
        return LogPerbaikan::create([
            'tiket_id' => $this->id,
            'user_id' => auth()->id() ?? 1,
            'kategori_log' => $kategori,
            'data_lama' => $lama,
            'data_baru' => $baru,
            'keterangan' => $keterangan,
            'created_at' => now(),
        ]);
    }
    public function updateStatus(
        string $statusBaru,
        ?string $catatan = null
    ) {
        $statusLama = $this->status;

        $this->update([
            'status' => $statusBaru
        ]);

        $this->tambahLog(
            'Status',
            $statusLama,
            $statusBaru,
            $catatan
        );
    }

    public function updatePrioritas(
        string $prioritasBaru,
        ?string $catatan = null
    ) {
        $prioritasLama = $this->prioritas;

        $this->update([
            'prioritas' => $prioritasBaru
        ]);

        $this->tambahLog(
            'Update Data',
            $prioritasLama,
            $prioritasBaru,
            'Prioritas diperbarui'
        );
    }

    public function sendMessage(
        string $pesan
    ) {
        return $this->tambahLog(
            'Chat',
            null,
            null,
            $pesan
        );
    }
    public function updateField(
        string $field,
        mixed $valueBaru
    ) {
        $valueLama = $this->$field;

        $this->update([
            $field => $valueBaru
        ]);

        $this->tambahLog(
            'Update Data',
            (string) $valueLama,
            (string) $valueBaru,
            "{$field} diperbarui"
        );
    }

    public function timeline()
    {
        return $this->logs()
            ->with('user')
            ->orderBy('created_at');
    }

}
