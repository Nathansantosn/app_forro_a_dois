import 'package:appforro/modules/reset/controller/repository/i_reset_password_repository.dart';
import 'package:appforro/modules/login/exeption/login_forgotpassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordRepository implements IResetPasswordRepository {
  ResetPasswordRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> updatePassword({required String newPassword}) async {
    try {
      await _client.auth.updateUser(UserAttributes(password: newPassword));
    } on AuthException catch (e) {
      throw ForgotPasswordException(e.message);
    } catch (_) {
      throw const ForgotPasswordException(
        'Não foi possível atualizar sua senha. Tente novamente.',
      );
    }
  }
}
