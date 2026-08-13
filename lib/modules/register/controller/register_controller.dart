import 'package:appforro/modules/login/model/user_role.dart';
import 'package:appforro/modules/register/controller/repository/i_register_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController {
  RegisterController(this._registerRepository);

  final IRegisterRepository _registerRepository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<UserRole> selectedRole = ValueNotifier(UserRole.aluno);

  Future<bool> cadastrar({
    required String nome,
    required String email,
    required String senha,
    required String confirmarSenha,
  }) async {
    errorMessage.value = null;

    final erroValidacao = _validar(nome, email, senha, confirmarSenha);
    if (erroValidacao != null) {
      errorMessage.value = erroValidacao;
      return false;
    }

    isLoading.value = true;
    try {
      await _registerRepository.register(
        nome: nome.trim(),
        email: email.trim(),
        password: senha,
        role: selectedRole.value,
      );
      return true;
    } catch (e) {
      errorMessage.value = _mapearErro(e);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  String? _validar(
    String nome,
    String email,
    String senha,
    String confirmarSenha,
  ) {
    if (nome.trim().isEmpty) return 'Informe seu nome';
    if (!email.contains('@')) return 'E-mail inválido';
    if (senha.length < 6) return 'A senha deve ter no mínimo 6 caracteres';
    if (senha != confirmarSenha) return 'As senhas não coincidem';
    return null;
  }

  String _mapearErro(Object e) {
    if (e is AuthException) return e.message;
    return 'Erro ao cadastrar. Tente novamente.';
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    selectedRole.dispose();
  }
}
