import 'package:appforro/modules/login/model/user_model.dart';
import 'package:appforro/modules/login/model/user_role.dart';
import 'package:appforro/modules/register/controller/repository/i_register_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterRepository implements IRegisterRepository {
  RegisterRepository(this._client);

  final SupabaseClient _client;
  static const String _profilesTable = 'profiles';

  @override
  Future<UserModel> register({
    required String nome,
    required String email,
    required String password,
    required UserRole role,
  }) async {
    final AuthResponse response = await _client.auth.signUp(
      email: email,
      password: password,
    );

    final User? user = response.user;
    if (user == null) {
      throw const AuthException('Não foi possível criar o usuário.');
    }

    final novoUsuario = UserModel(
      id: user.id,
      nome: nome,
      email: email,
      role: role,
    );

    await _client.from(_profilesTable).insert(novoUsuario.toMap());

    return novoUsuario;
  }
}
