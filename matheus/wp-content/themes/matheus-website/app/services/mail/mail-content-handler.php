<?php

class MailContentHandler
{

  private $form_option;
  private $subject;
  public function __construct($form_option = false)
  {
    $this->form_option = $form_option;
  }

  public function getAdminRecipients()
  {
    return '';
  }

  public function getRecipientsByFormOption()
  {
    switch ($this->form_option) {
      case 'fale-conosco':
        return 'fale@conosco.com.br';
      case 'trabalhe-conosco':
        return 'rh@mail.com.br';
      case 'seja-fornecedor':
        return 'contato@mail.com.br';
      default:
        return false;
    }
  }

  public function getEmailBody($recipients)
  {
    $form_body = '';

    $form_body .= "<h2>Mensagem recebida:</h2>";
    $form_body .= "<BR>";
    $form_body .= "<h3>Assunto: $this->subject </h3>";
    $form_body .= "<BR><BR>";
    $form_body .= "<strong>FORMULÁRIO</strong>: $this->form_option <BR>";
    $form_body .= "<strong>DESTINATÁRIOS</strong>: $recipients <BR>";

    $form_body .= "<strong>Campos enviados:</strong>:<BR>";


    $form_body .= "<BR> --- Fim do e-mail --- ";

    return $form_body;
  }


  public function getEmailSubject()
  {
    switch ($this->form_option) {
      case 'fale-conosco':
        return 'Fale Conosco';
      case 'trabalhe-conosco':
        return 'Trabalhe Conosco';
      case 'seja-fornecedor':
        return 'Seja Fornecedor';
      default:
        return false;
    }
  }
}
