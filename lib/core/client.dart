import 'package:dio/dio.dart';
import 'package:store/data/models/create_user_model.dart';
import 'exceptions/auth_exception.dart';
import 'interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://10.10.1.123:8888/api/v1",
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



  Future<List<dynamic>> fetchProducts({
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get(
      "/products/list",
      queryParameters: queryParams,
    );
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("Productlarni olib kelib bo'lmadi");
    }
  }
  
  Future save({required int productId}) async{
    var response=await dio.post("/auth/save/$productId");
    if(response.statusCode!=200){
      return AuthException();
    }
    
  }


  Future unSave({required int productId}) async{
    var response=await dio.post("/auth/unsave/$productId");
    if(response.statusCode!=200){
      return AuthException();
    }

  }


  Future<List<dynamic>> fetchCategories() async{
    var response=await dio.get("/categories/list");
    List<dynamic> data=response.data;
    if(response.statusCode==200){
      return data;
    }
    else{
      throw Exception("Categories not found");
    }
  }

  Future<List<dynamic>> fetchSizes() async{
    var response=await dio.get("/sizes/list");
    List<dynamic> data=response.data;
    if(response.statusCode==200){
      return data;
    }
    else{
      throw Exception("Sizes  not found");
    }
  }

  Future<List<dynamic>> savedProducts() async{
    var response=await dio.get("/products/saved-products");
    List<dynamic> data=response.data;
    if(response.statusCode==200){
      return data;
    }
    else{
      throw Exception("Saved Products   not found");
    }
  }
}
