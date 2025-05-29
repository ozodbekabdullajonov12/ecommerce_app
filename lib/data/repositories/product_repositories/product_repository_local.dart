import 'package:hive/hive.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/repositories/product_repositories/product_repository_interface.dart';

import '../../models/category_model.dart';
import '../../models/product_details_model.dart';
import '../../models/size_model.dart';

class ProductRepositoryLocal implements IProductRepository {
  static String productsBoxName = "products";
  static String savedProductBoxName = "saved-products";
  static String categoriesBoxName = "categories";
  static String sizesBoxName = "sizes";
  static String searchedProductsBoxName = "searched-products";
  static String productDetailBoxName = "product-detail";

  @override
  Future<List<ProductModel>> fetchProducts({
    Map<String, dynamic>? queryParams,
  }) async {
    final box = Hive.box<ProductModel>(productsBoxName);
    Iterable<ProductModel> products = box.values.toList();

    if (queryParams != null){
      final String? title = queryParams['Title'];
      if (title != null) {
        products = products.where((product) => product.title.toLowerCase().contains(title.toLowerCase()));
      }

      final id = queryParams["CategoryId"];
      if (id != null&&id!="") {
        products = products.where((product) => product.categoryId == id);
      }
    }


    return products.toList();
  }

  @override
  Future<List<SizeModel>> fetchSizes() async {
    final box = Hive.box<SizeModel>(sizesBoxName);
    final sizes = box.values.toList();
    return sizes;
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final box = Hive.box<CategoryModel>(categoriesBoxName);
    final categories = box.values.toList();
    return categories;
  }

  @override
  Future<List<ProductModel>> fetchSavedProducts() async {
    final box = Hive.box<ProductModel>(savedProductBoxName);
    final savedProducts = box.values.toList();
    return savedProducts;
  }

  @override
  Future<List<ProductModel>> fetchSearchedProducts({
    required String? title,
  }) async {
    final box = Hive.box<ProductModel>(searchedProductsBoxName);
    final products = box.values.toList();
    if (title == null) return products;
    final result =
        products.where((product) => product.title.contains(title)).toList();
    return result;
  }

  @override
  Future<ProductDetailsModel> fetchProductDetail(int productId) async {
    final box = Hive.box(productDetailBoxName);
    final productDetail=box.get(productId);
    return productDetail;
  }
}
