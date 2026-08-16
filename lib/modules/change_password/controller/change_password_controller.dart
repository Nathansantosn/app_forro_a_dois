import 'package:appforro/modules/change_password/controller/repository/change_password_repository_imp.dart';
import 'package:appforro/modules/change_password/controller/repository/i_change_password_repository.dart';
import 'package:flutter/foundation.dart';

class ChangePasswordController {
  ChangePasswordController(this._repository);

  final IChangePasswordRepository _repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<bool> success = ValueNotifier(false);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    errorMessage.value = null;

    if (currentPassword.isEmpty) {
      errorMessage.value = 'Informe sua senha atual';
      return;
    }
    if (newPassword.length < 6) {
      errorMessage.value = 'A nova senha deve ter no mínimo 6 caracteres';
      return;
    }
    if (newPassword != confirmPassword) {
      errorMessage.value = 'As senhas não coincidem';
      return;
    }
    if (newPassword == currentPassword) {
      errorMessage.value = 'A nova senha deve ser diferente da atual';
      return;
    }

    isLoading.value = true;
    try {
      await _repository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      success.value = true;
    } on ChangePasswordException catch (e) {
      errorMessage.value = e.message;
    } catch (_) {
      errorMessage.value = 'Erro ao trocar senha. Tente novamente.';
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    success.dispose();
  }
}
