abstract class ILoginRepository {
  Future<void> login({required String email, required String password});
}
