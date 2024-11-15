<?php
class MailService
{
  private $to;
  private $subject;
  private $body;
  private $headers;

  private $oficial_to;


  public function __construct($to, $subject, $body)
  {
    $this->to = $to;
    $this->body = $body;
    $this->subject = $subject;

    $this->headers = ['Content-Type: text/html; charset=UTF-8'];
  }

  public function postData()
  {
    $response = [
      'status' => false,
      'debug' => false,
    ];

    if (WP_DEBUG) {
      $this->oficial_to = $this->to;
      $this->to = 'debug@mail.com';
      $this->body .= "===== ENVIO TESTE - WP_DEBUG ATIVO =====";
      $this->body .= "<BR>";
      $this->body .= "Destinos originais: $this->oficial_to";
      $this->body .= "<BR>";
      $this->body .= "Destinos teste: $this->to";
      $this->body .= "<BR>";
      $this->body .= "===== ENVIO TESTE - WP_DEBUG ATIVO =====";
    }

    if (isset($this->to) && isset($this->body)) {
      try {
        $response['status'] = wp_mail($this->to, $this->subject, $this->body, $this->headers);
        $response['debug'] = $this->debug_wpmail();

      } catch (\Throwable $th) {
        $response['status'] = false;
        $response['debug'] = $th->getMessage();
      }

    }

    if (WP_DEBUG) {
      $response['recipients'] = $this->to;
      $response['body'] = $this->body;
    }

    return $response;
  }

  function debug_wpmail()
  {
    global $ts_mail_errors, $phpmailer;

    if (!isset($ts_mail_errors)) {
      $ts_mail_errors = array();
    }
    if (isset($phpmailer)) {
      $ts_mail_errors[] = $phpmailer->ErrorInfo;
    }
    return $ts_mail_errors;
  }
}