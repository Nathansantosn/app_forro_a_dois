import 'package:appforro/modules/delete_account/controller/repository/delete_account_repository_imp.dart';
import 'package:appforro/modules/delete_account/controller/repository/i_delete_account_repository.dart';
import 'package:flutter/foundation.dart';

class DeleteAccountController {
  DeleteAccountController(this._repository);

  final IDeleteAccountRepository _repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<bool> success = ValueNotifier(false);

  Future<void> deleteAccount() async {
    errorMessage.value = null;
    isLoading.value = true;
    try {
      await _repository.deleteAccount();
      success.value = true;
    } on DeleteAccountException catch (e) {
      errorMessage.value = e.message;
    } catch (_) {
      errorMessage.value = 'Erro ao deletar conta. Tente novamente.';
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
