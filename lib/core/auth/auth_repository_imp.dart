import 'package:appforro/core/auth/auth_repository.dart';

import 'package:appforro/modules/login/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._client);

  final SupabaseClient _client;
  static const String _profilesTable = 'profiles';

  @override
  UserModel? get currentUser {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    return null;
  }

  @override
  Stream<UserModel?> get onAuthStateChange {
    return _client.auth.onAuthStateChange.asyncMap((data) async {
      final user = data.session?.user;
      if (user == null) return null;

      final perfil = await _client
          .from(_profilesTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (perfil == null) return null;
      return UserModel.fromMap(perfil);
    });
  }

  @override
  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
