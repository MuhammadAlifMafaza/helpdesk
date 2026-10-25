{{-- Penyesuaian halaman cetak untuk browser (menimpa _styles milik DomPDF) --}}

{{-- Kertas A4 lanskap — menyamakan setelan DomPDF: setPaper('A4', 'landscape') --}}
@page {
    size: A4 landscape;
    margin: 14mm;
}

{{-- Kop cetak: statis di awal dokumen (posisi fixed ala DomPDF tak berlaku di browser) --}}
.document-header {
    position: static;
    height: auto;
    left: auto;
    right: auto;
    top: auto;
    margin-bottom: 6px;
}

{{-- Toolbar layar --}}
.print-toolbar {
    display: flex;
    gap: 8px;
    justify-content: center;
    margin: 0 auto 12px;
    max-width: 297mm;
}

.print-toolbar button {
    background: #4472c4;
    border: 1px solid #111;
    border-radius: 6px;
    color: #fff;
    cursor: pointer;
    font: inherit;
    font-weight: 600;
    padding: 8px 18px;
}

.print-toolbar button:last-child {
    background: #fff;
    color: #111;
}

{{-- Chrome layar saja: lembar putih di atas latar abu --}}
@media screen {
    body {
        background: #e5e7eb;
        padding: 14px;
    }

    .sheet {
        background: #fff;
        box-shadow: 0 1px 4px rgb(0 0 0 / 0.15);
        margin: 0 auto;
        max-width: 297mm;
        padding: 14mm;
    }
}

@media print {
    {{-- Sembunyikan toolbar --}}
    .no-print {
        display: none !important;
    }

    {{-- Warna latar (header tabel biru, kop) tetap tercetak --}}
    * {
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}
