import 'package:appforro/modules/login/controller/repository/i_forgor_passworda_repository.dart';
import 'package:appforro/modules/login/exeption/login_forgotpassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordRepository implements IForgotPasswordRepository {
  ForgotPasswordRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> sendResetEmail({required String email}) async {
    try {
      await _client.auth.resetPasswordForEmail(
        email,
        // Deep link do app. Precisa estar cadastrado em:
        // Supabase Dashboard > Authentication > URL Configuration > Redirect URLs
        redirectTo: 'appforro://reset-password',
      );
    } on AuthException catch (e) {
      throw ForgotPasswordException(e.message);
    } catch (_) {
      throw const ForgotPasswordException();
    }
  }
}
