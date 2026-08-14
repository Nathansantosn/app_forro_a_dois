class ForgotPasswordException implements Exception {
  const ForgotPasswordException([
    this.message = 'Não foi possível enviar o e-mail. Tente novamente.',
  ]);

  final String message;
}
