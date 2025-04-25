import 'package:equatable/equatable.dart';
import 'package:store/data/models/category_model.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/models/size_model.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final List<SizeModel> sizes;

  final int? currentCategoryId;
  final int? currentSizeId;

  final int? maxPrice;
  final int? minPrice;

  final String? title;
  final HomeStatus? status;
  final bool? orderBy;

  const HomeState({
    required this.products,
    required this.categories,
    required this.sizes,
    required this.currentCategoryId,
    required this.currentSizeId,
    required this.maxPrice,
    required this.minPrice,
    required this.title,
    required this.status,
    required this.orderBy,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      categories: [],
      sizes: [],
      currentCategoryId: 0,
      currentSizeId: null,
      maxPrice: null,
      minPrice: null,
      title: null,
      status: HomeStatus.loading,
      orderBy: false,
    );
  }

  HomeState copyWith({
    List<ProductModel>? products,
    List<CategoryModel>? categories,
    List<SizeModel>? sizes,
    int? currentCategoryId,
    int? currentSizeId,
    int? maxPrice,
    int? minPrice,
    String? title,
    HomeStatus? status,
    bool? orderBy,
  }) {
    return HomeState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      sizes: sizes ?? this.sizes,
      currentCategoryId: currentCategoryId ?? this.currentCategoryId,
      currentSizeId: currentSizeId ?? this.currentSizeId,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      title: title ?? this.title,
      status: status ?? this.status,
      orderBy: orderBy ?? this.orderBy,
    );
  }

  @override
  List<Object?> get props => [
    products,
    categories,
    sizes,
    currentCategoryId,
    currentSizeId,
    maxPrice,
    minPrice,
    title,
    status,
    orderBy,
  ];
}
