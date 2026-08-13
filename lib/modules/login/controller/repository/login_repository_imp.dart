import 'package:appforro/modules/login/controller/repository/ilogin_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> login({required String email, required String password}) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }
}
