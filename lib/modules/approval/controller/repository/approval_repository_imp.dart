import 'package:appforro/modules/approval/controller/repository/i_approval_repository.dart';
import 'package:appforro/modules/approval/model/pending_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApprovalRepository implements IApprovalRepository {
  ApprovalRepository(this._client);

  final SupabaseClient _client;
  static const _table = 'profiles';

  @override
  Future<List<PendingUserModel>> fetchPending() async {
    final data = await _client
        .from(_table)
        .select()
        .eq('status', 'pending')
        .order('created_at', ascending: false);

    return (data as List)
        .map((e) => PendingUserModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> approve(String userId) async {
    await _client.from(_table).update({'status': 'active'}).eq('id', userId);
  }

  @override
  Future<void> reject(String userId) async {
    await _client.from(_table).update({'status': 'cancelled'}).eq('id', userId);
  }
}
