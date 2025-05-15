import 'package:dio/dio.dart';
import 'package:store/data/models/create_user_model.dart';
import 'exceptions/auth_exception.dart';
import 'interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(baseUrl: "http://192.168.9.58:8888/api/v1", validateStatus: (value) => true),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<Map<String, dynamic>> login({required String login, required String password}) async {
    var response = await dio.post("/auth/login", data: {"login": login, "password": password});
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

  Future<void> resetPasswordEmail({required String email}) async {
    var response = await dio.post("/auth/reset-password/email", data: {'email': email});
    if (response.statusCode != 200) {
      throw Exception("xato ketdi reset email");
    }
  }

  Future<bool> resetPasswordVerify({required String email, required String code}) async {
    var response = await dio.post(
      "/auth/reset-password/verify",
      data: {'email': email, 'code': code},
    );
    if (response.data == true && response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }

  Future<void> resetPasswordReset({
    required String email,
    required String code,
    required String password,
  }) async {
    var response = await dio.post(
      "/auth/reset-password/reset",
      data: {'email': email, 'code': code, 'password': password},
    );
    if (response.statusCode == 200) {
      throw Exception("Xatolik vujudga keldi");
    }
  }

  Future<List<dynamic>> fetchProducts({Map<String, dynamic>? queryParams}) async {
    var response = await dio.get("/products/list", queryParameters: queryParams);
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Productlarni olib kelib bo'lmadi");
    }
  }

  Future save({required int productId}) async {
    var response = await dio.post("/auth/save/$productId");
    if (response.statusCode != 200) {
      return AuthException();
    }
  }

  Future unSave({required int productId}) async {
    var response = await dio.post("/auth/unsave/$productId");
    if (response.statusCode != 200) {
      return AuthException();
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get("/categories/list");
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Categories not found");
    }
  }

  Future<List<dynamic>> fetchSizes() async {
    var response = await dio.get("/sizes/list");
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Sizes  not found");
    }
  }

  Future<List<dynamic>> savedProducts() async {
    var response = await dio.get("/products/saved-products");
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Saved Products   not found");
    }
  }

  Future<List<dynamic>> fetchReviews(int productId) async {
    var response = await dio.get('/reviews/list/$productId');
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("reviews Statsda xatolik (statusCode: ${response.statusCode})");
      throw Exception("Reviewsda xatolik");
    }
  }

  Future<dynamic> fetchReviewStats(int productId) async {
    try {
      var response = await dio.get("/reviews/stats/$productId");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("reviews Statsda xatolik (statusCode: ${response.statusCode})");
      }
    } catch (e) {
      throw Exception("reviews Statsda xatolik");
    }
  }

  Future<dynamic> fetchProductDetail(int productId) async {
    var response = await dio.get("/products/detail/$productId");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Product Detailsni olib kelishda xatolik");
    }
  }

  Future<List<dynamic>> fetchNotifications() async {
    var response = await dio.get('/notifications/list');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("notificationni olib kelishda xatolik");
    }
  }
}
