import 'package:appforro/modules/login/controller/repository/i_login_repository.dart';
import 'package:appforro/modules/login/exxeption/login_exceptions.dart';
import 'package:appforro/modules/login/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._client);

  final SupabaseClient _client;

  static const _table = 'profile';

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final authResponse = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = authResponse.user?.id;
    if (userId == null) {
      throw const EnrollmentCancelledException(
        'Não foi possível validar seu acesso. Tente novamente.',
      );
    }

    // Busca o perfil correspondente. Se o registro foi deletado
    // OU está com status != 'active', maybeSingle() retorna null.
    final profileMap = await _client
        .from(_table)
        .select()
        .eq('id', userId)
        .eq('status', 'active')
        .maybeSingle();

    if (profileMap == null) {
      // Perfil não existe mais (deletado) ou foi cancelado (soft delete).
      // Derruba a sessão que o Supabase Auth acabou de criar.
      await _client.auth.signOut();
      throw const EnrollmentCancelledException();
    }

    return UserModel.fromMap(profileMap);
  }
}
