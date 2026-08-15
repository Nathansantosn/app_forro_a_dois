import 'package:appforro/modules/register/model/user_model.dart';

abstract class IAuthRepository {
  /// Usuário logado no momento (null se não houver sessão ativa)
  UserModel? get currentUser;

  /// Stream que emite sempre que o estado de autenticação mudar
  Stream<UserModel?> get onAuthStateChange;

  Future<void> logout();
}
