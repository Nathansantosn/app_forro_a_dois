enum UserRole {
  aluno,
  instrutor,
  avaliador,
  professor;

  String get label {
    switch (this) {
      case UserRole.aluno:
        return 'Aluno';
      case UserRole.instrutor:
        return 'Instrutor';
      case UserRole.avaliador:
        return 'Avaliador';
      case UserRole.professor:
        return 'Professor';
    }
  }

  String get value => name;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.aluno,
    );
  }
}
