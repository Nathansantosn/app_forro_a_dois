import 'package:appforro/modules/approval_user/model/pending_user_model.dart';

abstract class IApprovalRepository {
  Future<List<PendingUserModel>> fetchPending();
  Future<void> approve(String userId);
  Future<void> reject(String userId);
}
