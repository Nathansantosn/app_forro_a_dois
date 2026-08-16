import 'package:appforro/modules/approval_user/controller/repository/i_approval_repository.dart';
import 'package:appforro/modules/approval_user/model/pending_user_model.dart';
import 'package:flutter/foundation.dart';

class ApprovalController {
  ApprovalController(this._repository);

  final IApprovalRepository _repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<List<PendingUserModel>> pendingUsers = ValueNotifier([]);

  Future<void> carregar() async {
    isLoading.value = true;
    errorMessage.value = null;
    try {
      pendingUsers.value = await _repository.fetchPending();
    } catch (_) {
      errorMessage.value = 'Não foi possível carregar os cadastros pendentes.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> aprovar(String userId) async {
    try {
      await _repository.approve(userId);
      // Reassigna a lista (não só remove o item) pra garantir notificação,
      // já que ValueNotifier compara por referência.
      pendingUsers.value = List.of(pendingUsers.value)
        ..removeWhere((u) => u.id == userId);
    } catch (_) {
      errorMessage.value = 'Erro ao aprovar. Tente novamente.';
    }
  }

  Future<void> recusar(String userId) async {
    try {
      await _repository.reject(userId);
      pendingUsers.value = List.of(pendingUsers.value)
        ..removeWhere((u) => u.id == userId);
    } catch (_) {
      errorMessage.value = 'Erro ao recusar. Tente novamente.';
    }
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    pendingUsers.dispose();
  }
}
