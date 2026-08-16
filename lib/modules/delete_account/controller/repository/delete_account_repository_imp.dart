import 'package:appforro/modules/delete_account/controller/repository/i_delete_account_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteAccountException implements Exception {
  const DeleteAccountException([
    this.message = 'Não foi possível deletar sua conta. Tente novamente.',
  ]);

  final String message;
}

class DeleteAccountRepository implements IDeleteAccountRepository {
  DeleteAccountRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> deleteAccount() async {
    final session = _client.auth.currentSession;
    if (session == null) {
      throw const DeleteAccountException(
        'Sessão inválida. Faça login novamente.',
      );
    }

    try {
      // Chama a Edge Function 'delete-account'. O token do usuário logado
      // é enviado automaticamente no header Authorization pelo client do
      // Supabase, e a função valida esse token antes de deletar.
      final response = await _client.functions.invoke('delete-account');

      if (response.status != 200) {
        throw const DeleteAccountException();
      }
    } on FunctionException {
      throw const DeleteAccountException();
    } catch (_) {
      throw const DeleteAccountException();
    }

    // Garante que nenhuma sessão local continue válida depois da deleção.
    await _client.auth.signOut();
  }
}
