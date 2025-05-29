import 'package:hive/hive.dart';
import 'package:store/core/client.dart';
import 'package:store/data/models/category_model.dart';
import 'package:store/data/models/product_details_model.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/models/size_model.dart';
import 'package:store/data/repositories/product_repositories/product_repository_interface.dart';
import 'package:store/data/repositories/product_repositories/product_repository_local.dart';

class ProductRepositoryRemote implements IProductRepository {
  final ApiClient client;

  List<ProductModel> products = [];
  List<ProductModel> savedProducts = [];

  final productsBox = Hive.box<ProductModel>(ProductRepositoryLocal.productsBoxName);

  final savedProductsBox = Hive.box<ProductModel>(ProductRepositoryLocal.savedProductBoxName);
  final categoriesBox = Hive.box<CategoryModel>(ProductRepositoryLocal.categoriesBoxName);

  final sizesBox = Hive.box<SizeModel>(ProductRepositoryLocal.sizesBoxName);
  final productDetailBox = Hive.box<ProductDetailsModel>(ProductRepositoryLocal.productDetailBoxName);
  final searchedProducts = Hive.box<ProductModel>(ProductRepositoryLocal.searchedProductsBoxName);
  ProductRepositoryRemote({required this.client});

  @override
  Future<List<ProductModel>> fetchProducts({
    Map<String, dynamic>? queryParams,
  }) async {
    var rawProducts = await client.fetchProducts(queryParams: queryParams);
    products = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
    await productsBox.clear();
    await productsBox.addAll(products);
    return products;
  }


  @override
  Future<List<ProductModel>> fetchSearchedProducts({required String? title}) async {
    var rawProducts = await client.fetchProducts(queryParams: {
      "Title":title??""
    });
   final  searchedProducts = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
    return searchedProducts;
  }


  @override
  Future<List<ProductModel>> fetchSavedProducts() async {
    var rawProducts = await client.savedProducts();
    savedProducts = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
    savedProductsBox.clear();
    savedProductsBox.addAll(savedProducts);
    return savedProducts;
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    var rawCategories = await client.fetchCategories();
    final  categories = rawCategories.map((e) => CategoryModel.fromJson(e)).toList();
    categories.insert(0, CategoryModel(id: 0, title: "All"));
    categoriesBox.clear();
    categoriesBox.addAll(categories);
    return categories;
  }

  @override
  Future<List<SizeModel>> fetchSizes() async {
    var rawSizes = await client.fetchSizes();
    final sizes = rawSizes.map((e) => SizeModel.fromJson(e)).toList();
    sizesBox.clear();
    sizesBox.addAll(sizes);
    return sizes;
  }

  @override
  Future<ProductDetailsModel> fetchProductDetail(int productId) async {
    var rawProductDetail = await client.fetchProductDetail(productId);
    final productDetail=ProductDetailsModel.fromJson(rawProductDetail);
    productDetailBox.put(productDetail.id, productDetail);
    return productDetail;
  }


  Future<List<ProductModel>> savedProductsUnSave({required int productId}) async {
    await client.unSave(productId: productId);
    final result = savedProducts.where((item) => item.id != productId).toList();
    savedProducts = result;
    return savedProducts;
  }


  Future<List<ProductModel>> saveOrUnSave(
      {required int productId, required bool isLiked, Map<String,
          dynamic>? queryParams,}) async {
    if (isLiked) {
      await client.unSave(productId: productId);
    } else {
      await client.save(productId: productId);
    }
    if (products.isNotEmpty) {
      var productIndex = products.indexWhere((product) =>
      product.id == productId);
      products[productIndex].isLiked = !products[productIndex].isLiked;
      return products;
    } else {
      var rawProducts = await client.fetchProducts(queryParams: queryParams);
      products = rawProducts.map((e) => ProductModel.fromJson(e)).toList();
      return products;
    }
  }


}
