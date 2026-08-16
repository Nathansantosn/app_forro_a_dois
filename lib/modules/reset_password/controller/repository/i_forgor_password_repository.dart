abstract class IForgotPasswordRepository {
  Future<void> sendResetEmail({required String email});
}
