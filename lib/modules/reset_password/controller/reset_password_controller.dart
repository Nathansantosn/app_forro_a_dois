import 'package:appforro/modules/reset_password/controller/repository/i_reset_password_repository.dart';
import 'package:appforro/modules/login/exeption/login_forgotpassword.dart';
import 'package:flutter/foundation.dart';

class ResetPasswordController {
  ResetPasswordController(this._repository);

  final IResetPasswordRepository _repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);

  Future<bool> updatePassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    errorMessage.value = null;

    if (newPassword.length < 6) {
      errorMessage.value = 'A senha deve ter no mínimo 6 caracteres';
      return false;
    }
    if (newPassword != confirmPassword) {
      errorMessage.value = 'As senhas não coincidem';
      return false;
    }

    isLoading.value = true;
    try {
      await _repository.updatePassword(newPassword: newPassword);
      return true;
    } catch (e) {
      errorMessage.value = e is ForgotPasswordException
          ? e.message
          : 'Erro ao atualizar senha. Tente novamente.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
  }
}
