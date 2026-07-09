<?php

namespace App\Services\Laporan\Word;

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Settings;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\Style\Section;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use App\Services\Laporan\Word\Builders\HeaderBuilder;
use App\Services\Laporan\Word\Builders\TableBuilder;
use App\Services\Laporan\Word\Builders\SignatureBuilder;


abstract class BaseWordExporter
{
    protected PhpWord $word;
    protected $section;
    protected HeaderBuilder $headerBuilder;
    protected TableBuilder $tableBuilder;
    protected SignatureBuilder $signatureBuilder;

    /**
     * Nama file default
     */
    protected string $filename = 'laporan.docx';

    public function __construct()
    {
        $this->initialize();
        $this->registerStyles();
        $this->headerBuilder = new HeaderBuilder();
        $this->tableBuilder = new TableBuilder();
        $this->signatureBuilder = new SignatureBuilder();
        $this->build();
    }

    /* Generate seluruh isi dokumen */
    abstract protected function build(): void;

    /* Inisialisasi PHPWord */
    protected function initialize(): void
    {
        Settings::setZipClass(Settings::PCLZIP);

        $this->word = new PhpWord();
        $this->word->setDefaultFontName('Calibri');
        $this->word->setDefaultFontSize(11);
        $this->section = $this->word->addSection([
            'orientation' => Section::ORIENTATION_LANDSCAPE,

            'marginTop' => 600,
            'marginBottom' => 600,
            'marginLeft' => 700,
            'marginRight' => 700,
        ]);
    }

    /* Register seluruh style */
    protected function registerStyles(): void
    {
        $this->word->addTitleStyle(
            1,
            [
                'bold' => true,
                'size' => 16,
            ]
        );

        $this->word->addTitleStyle(
            2,
            [
                'bold' => true,
                'size' => 13,
            ]
        );

        $this->word->addTableStyle(
            'MainTable',
            [
                'borderSize' => 6,
                'borderColor' => '777777',
                'cellMargin' => 80,
            ],
            [
                'bgColor' => 'D9EAD3',
            ]
        );
    }

    /* Header Dokumen */
    protected function addHeader(
        string $title,
        ?string $subtitle = null
    ): void {

        $this->section->addTitle(
            'INSTITUT WIDYA PRATAMA',
            1
        );

        $this->section->addText(
            'P3SDI'
        );

        $this->section->addTextBreak();

        $this->section->addTitle(
            strtoupper($title),
            2
        );

        if ($subtitle) {
            $this->section->addText(
                $subtitle
            );
        }

        $this->section->addTextBreak();
    }

    protected function buildHeader(
        string $title,
        string $subtitle,
        ?string $periode = null,
        ?string $printedBy = null
    ): void {

        $this->headerBuilder->build(
            section: $this->section,
            title: $title,
            subtitle: $subtitle,
            periode: $periode,
            printedBy: $printedBy,
        );

    }

    /* Tabel Data */
    protected function buildTable(
        array $headers,
        array $rows
    ): void {

        $this->tableBuilder->build(
            section: $this->section,
            headers: $headers,
            rows: $rows
        );

    }

    /* Signature (TTD) */
    protected function buildSignature(
        string $title,
        string $name,
        string $city = 'Pekalongan',
    ): void {

        $this->signatureBuilder->build(
            section: $this->section,
            title: $title,
            name: $name,
            city: $city,
        );

    }

    /**
     * Footer
     */
    protected function addFooter(): void
    {
        $footer = $this->section->addFooter();

        $footer->addPreserveText(
            'Halaman {PAGE}'
        );
    }

    /* Save or Download File Word Document */
    protected function save(string $filename): string
    {
        $tempFile = sys_get_temp_dir()
            . DIRECTORY_SEPARATOR
            . uniqid('laporan_')
            . '.docx';

        $writer = IOFactory::createWriter(
            $this->word,
            'Word2007'
        );

        $writer->save($tempFile);

        return $tempFile;
    }

    /**
     * Download File
     */
    public function download(): BinaryFileResponse
    {
        return response()->download(
            $this->save($this->filename),
            $this->filename,
            [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            ]
        )->deleteFileAfterSend(true);
    }
}
