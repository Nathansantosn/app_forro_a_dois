import 'package:appforro/modules/register/model/user_model.dart';
import 'package:appforro/modules/register/model/user_role.dart';

abstract class IRegisterRepository {
  Future<UserModel> register({
    required String nome,
    required String email,
    required String password,
    required UserRole role,
  });
}
