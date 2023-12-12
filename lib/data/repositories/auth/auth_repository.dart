import 'package:fresh_dio/fresh_dio.dart';

import '../../../core/core.dart';

import '../repositories.dart';

part 'auth_repository_impl.dart';

extension AuthenticationStatusExt on AuthenticationStatus {
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}

abstract class AuthRepository {
  //
  Future<String> login({
    required String username,
    required String password,
  });
}
