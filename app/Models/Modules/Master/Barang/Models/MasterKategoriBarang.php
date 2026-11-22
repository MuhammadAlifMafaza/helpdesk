<?php

namespace App\Models\Modules\Master\Barang\Models;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterKategoriBarang extends Model
{
    use SoftDeletes;

    protected $table = 'master_kategori_barang';

    protected $fillable = [
        'nama_kategori',
        'deskripsi',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    /** Pengajuan yang menggunakan kategori ini, termasuk pengajuan terhapus. */
    public function pengajuanBarang(): HasMany
    {
        return $this->hasMany(
            PengajuanBarang::class,
            'kategori_barang_id'
        )->withTrashed();
    }

    /**
     * Scope kategori aktif.
     *
     * Digunakan ketika kategori diperlukan
     * untuk transaksi/data baru.
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope kategori tidak aktif.
     */
    public function scopeInactive(Builder $query): Builder
    {
        return $query->where('is_active', false);
    }

    /**
     * Menentukan apakah kategori aktif.
     */
    public function isActive(): bool
    {
        return $this->is_active === true;
    }

    public function hasPengajuanBarang(): bool
    {
        return $this->pengajuanBarang()->exists();
    }

    public function getJumlahPengajuanBarangAttribute(): int
    {
        return $this->pengajuanBarang()->count();
    }

    /**
     * Menentukan apakah kategori dapat digunakan
     * untuk pengajuan baru.
     */
    public function canBeUsedForNewPengajuan(): bool
    {
        return $this->deleted_at === null
            && $this->is_active === true;
    }

    /**
     * Menentukan apakah kategori aman
     * untuk physical delete.
     *
     * Kategori tidak boleh dihapus permanen
     * apabila masih digunakan oleh pengajuan.
     */
    public function canBeForceDeleted(): bool
    {
        return ! $this->pengajuanBarang()->exists();
    }

    /**
     * Proteksi physical delete.
     */
    protected static function booted(): void
    {
        static::forceDeleting(
            function (MasterKategoriBarang $kategori): void {
                if (! $kategori->canBeForceDeleted()) {
                    throw new \RuntimeException(
                        'Kategori barang tidak dapat dihapus secara permanen '
                        .'karena masih digunakan oleh pengajuan barang.'
                    );
                }
            }
        );
    }
}
