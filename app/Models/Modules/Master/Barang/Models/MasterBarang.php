<?php

namespace App\Models\Modules\Master\Barang\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;

#[Fillable([
    'kategori_barang_id',
    'nama_barang',
    'keterangan',
    'is_active',
])]
class MasterBarang extends Model
{
    use SoftDeletes;

    protected $table = 'master_barang';

    protected $fillable = [
        'kategori_barang_id',
        'nama_barang',
        'keterangan',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    /**
     * Relasi ke Master Kategori Barang.
     */
    public function kategoriBarang(): BelongsTo
    {
        return $this->belongsTo(
            MasterKategoriBarang::class,
            'kategori_barang_id'
        );
    }

    public function pengajuanBarang(): HasMany
    {
        return $this->hasMany(
            PengajuanBarang::class,
            'barang_id'
        );
    }

    /**
     * Alias relasi kategori.
     */
    public function kategori(): BelongsTo
    {
        return $this->kategoriBarang();
    }

    /**
     * Scope barang aktif.
     *
     * Digunakan untuk data baru/transaksi baru.
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope barang tidak aktif.
     */
    public function scopeInactive(Builder $query): Builder
    {
        return $query->where('is_active', false);
    }

    /**
     * Apakah barang aktif?
     */
    public function isActive(): bool
    {
        return $this->is_active === true;
    }

    /**
     * Apakah barang dapat digunakan untuk data baru?
     *
     * Barang harus:
     * - belum di-soft-delete
     * - aktif
     * - memiliki kategori
     * - kategorinya aktif
     */
    public function canBeUsedForNewTransaction(): bool
    {
        return $this->deleted_at === null
            && $this->is_active === true
            && $this->kategoriBarang !== null
            && $this->kategoriBarang->isActive();
    }

    /**
     * Apakah kategori barang masih aktif?
     */
    public function kategoriIsActive(): bool
    {
        return $this->kategoriBarang?->isActive() ?? false;
    }

    /**
     * Nama kategori barang.
     */
    public function getNamaKategoriAttribute(): ?string
    {
        return $this->kategoriBarang?->nama_kategori;
    }

    /**
     * Cegah physical delete jika barang
     * sudah digunakan oleh transaksi.
     *
     * Relasi transaksi akan kita tambahkan
     * ketika model PengajuanBarang difinalisasi.
     */

    public function canBeForceDeleted(): bool
    {
        return !$this->barang()
            ->withTrashed()
            ->exists();
    }

    protected static function booted(): void
    {
        static::forceDeleting(function (MasterBarang $barang): void {
            if ($barang->pengajuanBarang()->exists()) {
                throw new \RuntimeException(
                    'Barang tidak dapat dihapus secara permanen karena sudah digunakan pada transaksi pengajuan barang.'
                );
            }
        });
    }
}
