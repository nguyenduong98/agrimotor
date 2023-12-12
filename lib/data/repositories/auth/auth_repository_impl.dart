part of 'auth_repository.dart';

class AuthRepositoryImpl extends BaseRepository {
  //
  AuthRepositoryImpl();

  Future<String> login({
    required String username,
    required String password,
  }) async {
    Future.delayed(const Duration(milliseconds: 500), () {});
    return '';
  }
}
