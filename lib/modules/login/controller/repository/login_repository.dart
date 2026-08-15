import 'package:appforro/modules/login/controller/repository/i_login_repository.dart';
import 'package:appforro/modules/login/exeption/login_exceptions.dart';
import 'package:appforro/modules/login/exeption/login_pending.dart';
import 'package:appforro/modules/register/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._client);

  final SupabaseClient _client;

  static const _table = 'profiles';

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

    // Busca o perfil sem filtrar por status ainda, pra sabermos
    // diferenciar "não existe" (deletado/cancelado) de "existe mas pendente".
    final profileMap = await _client
        .from(_table)
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (profileMap == null) {
      // Registro não existe mais (deletado do banco).
      await _client.auth.signOut();
      throw const EnrollmentCancelledException();
    }

    final status = profileMap['status'] as String? ?? 'active';

    if (status == 'pending') {
      await _client.auth.signOut();
      throw const PendingEnrollmentException();
    }

    if (status == 'cancelled') {
      await _client.auth.signOut();
      throw const EnrollmentCancelledException();
    }

    return UserModel.fromMap(profileMap);
  }
}
