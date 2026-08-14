class PendingEnrollmentException implements Exception {
  const PendingEnrollmentException([
    this.message =
        'Seu cadastro ainda está em análise. Assim que sua matrícula for confirmada você poderá acessar o app.',
  ]);

  final String message;
}
