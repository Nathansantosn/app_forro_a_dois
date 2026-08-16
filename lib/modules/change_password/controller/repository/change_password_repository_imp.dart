import 'package:appforro/modules/change_password/controller/repository/i_change_password_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordException implements Exception {
  const ChangePasswordException([
    this.message = 'Não foi possível trocar a senha. Tente novamente.',
  ]);

  final String message;
}

class ChangePasswordRepository implements IChangePasswordRepository {
  ChangePasswordRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final email = _client.auth.currentUser?.email;
    if (email == null) {
      throw const ChangePasswordException(
        'Sessão inválida. Faça login novamente.',
      );
    }

    // Reautentica com a senha atual antes de trocar, por segurança.
    try {
      await _client.auth.signInWithPassword(
        email: email,
        password: currentPassword,
      );
    } on AuthException {
      throw const ChangePasswordException('Senha atual incorreta.');
    }

    try {
      await _client.auth.updateUser(UserAttributes(password: newPassword));
    } on AuthException catch (e) {
      throw ChangePasswordException(e.message);
    } catch (_) {
      throw const ChangePasswordException();
    }
  }
}
