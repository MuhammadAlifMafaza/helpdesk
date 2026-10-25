@extends('laporan.print.layout')

@section('content')
    <table class="data-table">
        <thead>
            <tr>
                <th width="4%">No</th>
                <th width="10%">Tanggal</th>
                <th width="25%">Petugas</th>
                <th width="12%">Lokasi</th>
                <th width="43%">Deskripsi Kegiatan</th>
            </tr>
        </thead>
        <tbody>
            @forelse($records as $index => $row)
                <tr>
                    <td class="center">{{ $index + 1 }}</td>
                    <td class="center">{{ $row->tanggal_kegiatan?->format('d/m/Y') ?? '-' }}</td>
                    <td>{{ $row->nama_teknisi ?? '-' }}</td>
                    <td class="center">{{ $row->lokasi ?? '-' }}</td>
                    <td>{{ $row->deskripsi ?? '-' }}</td>
                </tr>
            @empty
                <tr>
                    <td class="empty-row" colspan="5">Tidak ada kegiatan pada periode ini.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
@endsection
