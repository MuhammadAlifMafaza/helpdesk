<?php

namespace App\Models\Modules\Master\Barang\Models;

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

    /**
     * Relasi kategori ke master barang.
     */
    public function barang(): HasMany
    {
        return $this->hasMany(
            MasterBarang::class,
            'kategori_barang_id'
        );
    }

    /**
     * Scope kategori aktif.
     *
     * Hanya kategori aktif yang dapat digunakan
     * untuk data baru.
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
     * Apakah kategori aktif?
     */
    public function isActive(): bool
    {
        return $this->is_active === true;
    }

    /**
     * Apakah kategori memiliki barang?
     *
     * Jumlah tidak disimpan sebagai kolom.
     */
    public function hasBarang(): bool
    {
        return $this->barang()->exists();
    }

    /**
     * Jumlah barang berdasarkan relasi.
     */
    public function getJumlahBarangAttribute(): int
    {
        return $this->barang()->count();
    }

    /**
     * Apakah kategori dapat digunakan
     * untuk data baru?
     */
    public function canBeUsedForNewBarang(): bool
    {
        return $this->deleted_at === null
            && $this->is_active === true;
    }

    /**
     * Proteksi physical delete.
     *
     * Soft delete tetap diperbolehkan.
     */
    public function canBeForceDeleted(): bool
    {
        return ! $this->barang()
            ->withTrashed()
            ->exists();
    }

    protected static function booted(): void
    {
        static::forceDeleting(function (MasterKategoriBarang $kategori): void {
            if (! $kategori->canBeForceDeleted()) {
                throw new \RuntimeException(
                    'Kategori barang tidak dapat dihapus secara permanen '
                    .'karena masih memiliki relasi barang.'
                );
            }
        });
    }
}
