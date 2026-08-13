import 'package:appforro/modules/login/controller/repository/ilogin_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController {
  LoginController(this._loginRepository);

  final ILoginRepository _loginRepository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);

  Future<bool> login({required String email, required String password}) async {
    errorMessage.value = null;

    if (email.trim().isEmpty || !email.contains('@')) {
      errorMessage.value = 'E-mail inválido';
      return false;
    }
    if (password.isEmpty) {
      errorMessage.value = 'Informe sua senha';
      return false;
    }

    isLoading.value = true;
    try {
      await _loginRepository.login(email: email.trim(), password: password);
      return true;
    } catch (e) {
      errorMessage.value = _mapearErro(e);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  String _mapearErro(Object e) {
    if (e is AuthException) {
      if (e.message.contains('Invalid login credentials')) {
        return 'E-mail ou senha incorretos';
      }
      return e.message;
    }
    return 'Erro ao fazer login. Tente novamente.';
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
  }
}
