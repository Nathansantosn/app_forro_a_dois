import 'package:appforro/modules/login/controller/repository/i_forgor_passworda_repository.dart';
import 'package:appforro/modules/login/exeption/login_forgotpassword.dart';
import 'package:flutter/foundation.dart';

class ForgotPasswordController {
  ForgotPasswordController(this._repository);

  final IForgotPasswordRepository _repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<bool> emailSent = ValueNotifier(false);

  Future<void> sendResetEmail({required String email}) async {
    errorMessage.value = null;

    final trimmed = email.trim();
    if (trimmed.isEmpty || !trimmed.contains('@')) {
      errorMessage.value = 'Informe um e-mail válido';
      return;
    }

    isLoading.value = true;
    try {
      await _repository.sendResetEmail(email: trimmed);
      emailSent.value = true;
    } catch (e) {
      errorMessage.value = e is ForgotPasswordException
          ? e.message
          : 'Erro ao enviar e-mail. Tente novamente.';
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    emailSent.dispose();
  }
}
