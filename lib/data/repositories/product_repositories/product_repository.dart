import 'package:store/core/connection_state.dart';
import 'package:store/data/models/category_model.dart';
import 'package:store/data/models/product_details_model.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/models/size_model.dart';
import 'package:store/data/repositories/product_repositories/product_repository_interface.dart';
import 'package:store/data/repositories/product_repositories/product_repository_local.dart';
import 'package:store/data/repositories/product_repositories/product_repository_remote.dart';


class ProductRepository implements IProductRepository {
  final ProductRepositoryLocal _localRepo;

  final ProductRepositoryRemote _remoteRepo;

  late bool isOnline = true;

  ProductRepository({
    required ProductRepositoryLocal localRepo,
    required ProductRepositoryRemote remoteRepo,
    required ConnectionStateCubit connectionCubit,
  }) : _localRepo = localRepo,
       _remoteRepo = remoteRepo {
    connectionCubit.stream.listen((state) {
      isOnline = state.isOnline;
    });
  }

  @override
  Future<List<ProductModel>> fetchProducts({Map<String, dynamic>? queryParams}) async {
    if (isOnline) {
      final products = await _remoteRepo.fetchProducts(queryParams: queryParams);
      return products;
    } else {
      final products = await _localRepo.fetchProducts(queryParams: queryParams);
      return products;
    }
  }

  @override
  Future<List<ProductModel>> fetchSavedProducts() async {
    if (isOnline) {
      final savedProducts = await _remoteRepo.fetchSavedProducts();
      return savedProducts;
    } else {
      final savedProducts = await _localRepo.fetchSavedProducts();
      return savedProducts;
    }
  }

  @override
  Future<List<ProductModel>> fetchSearchedProducts({required String? title}) async {
    if (isOnline) {
      final searchedProducts = await _remoteRepo.fetchSearchedProducts(title: title);
      return searchedProducts;
    } else {
      final searchedProducts = await _localRepo.fetchSearchedProducts(title: title);
      return searchedProducts;
    }
  }

  @override
  Future<List<SizeModel>> fetchSizes() async {
    if (isOnline) {
      final sizes = await _remoteRepo.fetchSizes();
      return sizes;
    } else {
      final sizes = await _localRepo.fetchSizes();
      return sizes;
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    if (isOnline) {
      final categories = await _remoteRepo.fetchCategories();
      return categories;
    } else {
      final categories = await _localRepo.fetchCategories();
      return categories;
    }
  }

  @override
  Future<ProductDetailsModel> fetchProductDetail(int productId) async {
    if (isOnline) {
      final productDetail = await _remoteRepo.fetchProductDetail(productId);
      return productDetail;
    } else {
      final productDetail = await _localRepo.fetchProductDetail(productId);
      return productDetail;
    }
  }

  Future<List<ProductModel>> savedProductsUnSave({required int productId}) =>
      _remoteRepo.savedProductsUnSave(productId: productId);

  Future<List<ProductModel>> saveOrUnSave({
    required int productId,
    required bool isLiked,
    Map<String, dynamic>? queryParams,
  }) => _remoteRepo.saveOrUnSave(productId: productId, isLiked: isLiked);
  Future<bool> addProduct({required int productId, required int sizeId})=>
      _remoteRepo.addProduct(productId: productId, sizeId: sizeId);
}
