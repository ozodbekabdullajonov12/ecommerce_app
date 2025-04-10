import 'package:dio/dio.dart';
import 'package:store/data/models/create_user_model.dart';
import 'exceptions/auth_exception.dart';
import 'interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.0.103:8888/api/v1",
        validateStatus: (value) => true,
      ),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<Map<String, dynamic>> login({
    required String login,
    required String password,
  }) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      String token = data["accessToken"]!.toString();
      return {"result": true, "token": token};
    } else {
      return {"result": false, "token": null};
    }
  }

  Future<Map<String, dynamic>> signUp({required CreateUserModel user}) async {
    var responce = await dio.post("/auth/register", data: user.toJson());
    if (responce.statusCode == 201) {
      String token = responce.data["accessToken"];
      return {"result": true, "token": token};
    } else {
      return {"result": true, "token": null};
    }
  }

  Future<String> postForgotEmail(String email) async {
    var response = await dio.post(
      "/auth/reset-password/email",
      data: {'email': email},
    );
    if (response.statusCode == 200) {
      final data = Map<String, String>.from(response.data);
      return data['email']!;
    } else {
      throw Exception("xato ketdi reset email");
    }
  }
  
  Future<List<dynamic>> fetchProducts()async {
    var response = await dio.get("/products/list");
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("FetchProducts ishlamadi");
    }
  }
}
