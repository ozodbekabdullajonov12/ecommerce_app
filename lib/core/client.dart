import 'package:dio/dio.dart';
import 'package:store/data/models/create_user_model.dart';
import 'exceptions/auth_exception.dart';
import 'interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.40.182:8888/api/v1",
        validateStatus: (value) => true,
      ),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;


  Future<String> login(
      {required String login, required String password}) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data["accessToken"]!.toString();
    } else {
      throw AuthException();
    }
  }

  Future<Map<String, dynamic>> signUp({required CreateUserModel user}) async {
    var responce = await dio.post("/auth/register", data: user.toJson());
    if (responce.statusCode == 201) {
      String token = responce.data["accessToken"];
      return {
        "result": true,
        "token": token,
      };
    } else {
      return {
        "result": true,
        "token": null,
      };
    }
  }
}
