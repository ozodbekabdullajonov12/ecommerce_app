import 'package:store/core/client.dart';
import 'package:store/features/home/data/models/product_model.dart';

class HomeRepository {
  final ApiClient client;

   List<ProductModel> products = [];

  HomeRepository({required this.client});

  Future<List<ProductModel>> fetchProducts() async{
    var product = await client.fetchProducts();
    products = product.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}