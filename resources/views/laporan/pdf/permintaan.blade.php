<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>{{ $title }}</title>
    <style>
        body { font-family: sans-serif; font-size: 11px; }
        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .font-bold { font-weight: bold; }
        .mb-2 { margin-bottom: 20px; }
        
        /* Desain Tabel Utama */
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table.data-table th, table.data-table td {
            border: 1px solid #444;
            padding: 6px;
            text-align: left;
            vertical-align: middle;
        }
        table.data-table th {
            background-color: #D9EAD3;
            text-align: center;
        }

        /* Desain Tabel Info & TTD */
        table.layout-table {
            width: 100%;
            border: none;
        }
        table.layout-table td {
            border: none;
            padding: 2px;
        }
    </style>
</head>
<body>

    <div class="text-center mb-2">
        <h2 style="margin: 0;">{{ $title }}</h2>
        <p style="margin: 5px 0 0 0; font-size: 12px;">{{ $documentNumber }}</p>
    </div>

    <table class="layout-table">
        <tr>
            <td width="15%" class="font-bold">Periode</td>
            <td width="2%">:</td>
            <td>{{ $periode }}</td>
        </tr>
        <tr>
            <td class="font-bold">Tanggal Cetak</td>
            <td>:</td>
            <td>{{ $printDate }}</td>
        </tr>
        <tr>
            <td class="font-bold">Dicetak Oleh</td>
            <td>:</td>
            <td>{{ $printedBy }}</td>
        </tr>
    </table>

    <table class="data-table mb-2">
        <thead>
            <tr>
                <th width="3%">No</th>
                <th width="12%">Kode Pengajuan</th>
                <th width="12%">Pemohon</th>
                <th width="15%">Nama Barang</th>
                <th width="6%">Jumlah</th>
                <th width="12%">Status</th>
                <th width="10%">Hasil</th>
                <th width="10%">Mulai</th>
                <th width="10%">Selesai</th>
                <th width="10%">Durasi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($records as $index => $row)
            <tr>
                <td class="text-center">{{ $index + 1 }}</td>
                <td class="text-center">{{ $row->kode_pengajuan }}</td>
                <td>{{ $row->nama_pemohon }}</td>
                <td>{{ $row->nama_barang }}</td>
                <td class="text-center">{{ $row->pengajuan?->jumlah ?? '-' }}</td>
                <td class="text-center">{{ $row->status_label }}</td>
                <td class="text-center">{{ $row->outcome_label }}</td>
                <td class="text-center">{{ $row->waktu_mulai ? $row->waktu_mulai->format('d/m/Y H:i') : '-' }}</td>
                <td class="text-center">{{ $row->waktu_selesai ? $row->waktu_selesai->format('d/m/Y H:i') : '-' }}</td>
                <td>{{ $row->durasi }}</td>
            </tr>
            @endforeach
            
            @if($records->isEmpty())
            <tr>
                <td colspan="10" class="text-center" style="padding: 20px;">Tidak ada data pada periode ini.</td>
            </tr>
            @endif
        </tbody>
    </table>

    <table class="layout-table" style="margin-top: 40px; page-break-inside: avoid;">
        <tr>
            <td class="text-right" colspan="2" style="padding-bottom: 20px;">
                Pekalongan, {{ \Carbon\Carbon::now()->locale('id')->translatedFormat('d F Y') }}
            </td>
        </tr>
        <tr>
            <td width="50%" class="text-center font-bold">{{ $signatures[0]['title'] }}</td>
            <td width="50%" class="text-center font-bold">{{ $signatures[1]['title'] }}</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 70px;"></td> </tr>
        <tr>
            <td class="text-center font-bold" style="text-decoration: underline;">{{ $signatures[0]['name'] }}</td>
            <td class="text-center font-bold" style="text-decoration: underline;">{{ $signatures[1]['name'] }}</td>
        </tr>
    </table>

</body>
</html>