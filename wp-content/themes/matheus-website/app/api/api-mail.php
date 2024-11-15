<?php


add_action('rest_api_init', function () {
  register_rest_route(
    '/api',
    '/email',
    [
      'methods' => WP_REST_Server::CREATABLE,
      'callback' => 'api_post_data_route_action',
      'validation' => 'api_post_data_validation',
      'permission_callback' => '',
    ]
  );
});

function api_post_data_validation(): void
{
}

function api_post_data_route_action($request)
{
  $response = [
    'status' => 'error',
    'message' => __('Falha ao tentar enviar o email!', 'mondiana-website'),
    'mail_status' => false
  ];

  $body = json_decode($request->get_body(), true);
  $form_option = isset($body['form_option']) ? sanitize_text_field($body['form_option']) : null;

  // Mail Content Handler - criado a partir do Identificador e Subject
  $mail_content_handler = new MailContentHandler($form_option);

  $recipients = $mail_content_handler->getRecipientsByFormOption();

  if ($recipients === false) {
    $response['message'] = __('Configuração do formulário incorreta! form_option incorreto.', 'mondiana-website');
    return rest_ensure_response($response);
  }

  $email_body = $mail_content_handler->getEmailBody($recipients);
  $subject = $mail_content_handler->getEmailSubject();

  $mail_service = new MailService($recipients, $subject, $email_body);
  $mail_response = $mail_service->postData();

  if ($mail_response['status'] === true) {
    $response['status'] = true;
    $response['message'] = __('E-mail enviado com sucesso!', 'mondiana-website');
    $response['mail_status'] = $mail_response;
  }

  return rest_ensure_response($response);
}
