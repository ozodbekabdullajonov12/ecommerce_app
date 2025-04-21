import 'package:store/data/models/create_user_model.dart';

import '../../core/client.dart';
import '../../core/secure_storage.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  Future<bool> login({required String login, required String password}) async {
    final result=await client.login(login: login, password: password);
  if(result["result"]){
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token: result["token"]);
  }
  return result["result"];
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
      await SecureStorage.saveToken(token: jwt["token"]);
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
  Future<void> resetPasswordEmail({required String email}) async{
    client.resetPasswordEmail(email: email);
  }
  Future<bool> resetPasswordVerify({required String email, required String code})async{
    final result = client.resetPasswordVerify(email: email, code: code);
    return result;
  }
  Future<void> resetPasswordReset({required String email, required String code, required String password})async{
    client.resetPasswordReset(email: email, code: code, password: password);
  }
}

