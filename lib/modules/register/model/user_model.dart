import 'package:appforro/modules/register/model/user_role.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.role,
  });

  final String id; // UUID único, gerado automaticamente pelo Supabase Auth
  final String nome;
  final String email;
  final UserRole role;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      role: UserRole.fromString(map['role'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'email': email, 'role': role.value};
  }
}
