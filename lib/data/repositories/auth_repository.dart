import 'package:store/data/models/create_user_model.dart';

import '../../core/client.dart';
import '../../core/secure_storage.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  Future<void> login({required String login, required String password}) async {
    final String token = await client.login(login: login, password: password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token: token);
  }

  Future logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials!['login'] == null || credentials["password"] == null) {
      return false;
    } else {
      var jwt = await client.login(
        login: credentials['login']!,
        password: credentials["password"]!,
      );
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: jwt);
      return true;
    }
  }

  Future<bool> signUp({
    required String fullName,
    required String email,

    required String password,
  }) async {
    final result = await client.signUp(
      user: CreateUserModel(
        password: password,
        email: email,
        fullName: fullName,
      ),
    );

    if (result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: email, password: password);
      return true;
    } else {
      return false;
    }
  }
  Future<String> forgot(String email) async{
    return await client.postForgotEmail(email);
  }
}
class ForgotPassword{
  final String email;
  final String code;
  ForgotPassword({
    required this.email,
    required this.code
});
}
