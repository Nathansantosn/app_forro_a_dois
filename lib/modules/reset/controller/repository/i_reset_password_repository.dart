abstract class IResetPasswordRepository {
  Future<void> updatePassword({required String newPassword});
}
