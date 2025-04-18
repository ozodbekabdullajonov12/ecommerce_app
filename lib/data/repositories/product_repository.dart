import 'package:store/core/client.dart';
import 'package:store/data/models/category_model.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/models/size_model.dart';

class ProductRepository {
  final ApiClient client;

  List<ProductModel> products = [];

  List<ProductModel> savedProducts = [];

  List<CategoryModel> categories = [];

  List<SizeModel> sizes = [];

  ProductRepository({required this.client});

  Future<List<ProductModel>> fetchProducts({
    Map<String, dynamic>? queryParams,
  }) async {
    var rawProducts = await client.fetchProducts(queryParams: queryParams);
    products = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }

  Future save({required int productId}) async {
    await client.save(productId: productId);
  }

  Future unSave({required int productId}) async {
    await client.unSave(productId: productId);
  }

  Future<List<ProductModel>> fetchSavedProducts() async {
    var rawProducts = await client.savedProducts();
    savedProducts = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
    return savedProducts;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    if(categories.isNotEmpty) return categories;
    var rawCategories = await client.fetchCategories();
    categories = rawCategories.map((e) => CategoryModel.fromJson(e)).toList();
    return categories;
  }

  Future<List<SizeModel>> fetchSizes() async {
    if(sizes.isNotEmpty) return sizes;
    var rawSizes = await client.fetchSizes();
    sizes = rawSizes.map((e) => SizeModel.fromJson(e)).toList();
    return sizes;
  }


}
