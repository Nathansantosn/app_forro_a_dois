class EnrollmentCancelledException implements Exception {
  const EnrollmentCancelledException([
    this.message =
        'Sua matrícula foi cancelada. Entre em contato com a coordenação.',
  ]);

  final String message;
}
