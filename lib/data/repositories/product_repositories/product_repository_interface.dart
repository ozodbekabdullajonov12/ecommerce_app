import '../../models/category_model.dart';
import '../../models/product_details_model.dart';
import '../../models/product_model.dart';
import '../../models/size_model.dart';

abstract interface class IProductRepository {
  Future<List<ProductModel>> fetchProducts({Map<String, dynamic>? queryParams});

  Future<List<ProductModel>> fetchSearchedProducts({required String? title});

  Future<List<ProductModel>> fetchSavedProducts();
  Future<List<CategoryModel>> fetchCategories();

  Future<List<SizeModel>> fetchSizes();

  Future<ProductDetailsModel> fetchProductDetail(int productId);
}
