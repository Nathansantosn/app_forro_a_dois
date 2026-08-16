import 'package:appforro/modules/register/model/user_model.dart';

abstract class ILoginRepository {
  Future<UserModel> login({required String email, required String password});

  /// Verifica se já existe uma sessão salva localmente (login anterior)
  /// e, se existir, valida o status do perfil de novo — porque a matrícula
  /// pode ter sido cancelada ou ainda estar pendente desde a última vez
  /// que o app foi usado. Retorna null se não houver sessão salva.
  Future<UserModel?> restoreSession();
}
