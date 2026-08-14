import 'package:appforro/modules/login/model/user_role.dart';

class PendingUserModel {
  const PendingUserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.role,
    required this.status,
    required this.createdAt,
  });

  final String id;
  final String nome;
  final String email;
  final UserRole role;
  final String status; // 'pending' | 'active' | 'cancelled'
  final DateTime? createdAt;

  factory PendingUserModel.fromMap(Map<String, dynamic> map) {
    return PendingUserModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      role: UserRole.fromString(map['role'] as String),
      status: map['status'] as String? ?? 'pending',
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'] as String)
          : null,
    );
  }
}
