<?php

function download_all_pdfs()
{
    if (isset($_GET['download_all']) && $_GET['download_all'] === 'true') {
        $links_pdf = array();
        if (have_rows('repetidor_kit_investidores', 'option')) {
            while (have_rows('repetidor_kit_investidores', 'option')) {
                the_row();
                $pdf_link = get_sub_field('arquivo', 'option');
                $links_pdf[] = $pdf_link;
            }
        }

        if (!empty($links_pdf)) {
            $zip = new ZipArchive();
            $zip_filename = 'todos_os_pdfs.zip';

            if ($zip->open($zip_filename, ZipArchive::CREATE) === TRUE) {
                foreach ($links_pdf as $pdf_link) {
                    $pdf_filename = basename($pdf_link);
                    $pdf_file_contents = file_get_contents($pdf_link);
                    $zip->addFromString($pdf_filename, $pdf_file_contents);
                }

                $zip->close();

                // Envia o arquivo zip para download
                header('Content-Type: application/zip');
                header('Content-Disposition: attachment; filename="' . $zip_filename . '"');
                readfile($zip_filename);

                // Exclui o arquivo zip após o download
                unlink($zip_filename);
                exit;
            } else {
                echo 'Erro ao criar o arquivo zip.';
            }
        }
    }
}

add_action('init', 'download_all_pdfs');
