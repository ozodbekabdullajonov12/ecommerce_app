
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/data/models/category_model.dart';
import 'package:store/data/models/size_model.dart';

import '../../../../data/models/product_model.dart';
part 'home_state.freezed.dart';

enum HomeStatus { idle, loading, error }
@freezed
abstract class HomeState with  _$HomeState{


  const factory HomeState({
    required List<ProductModel> products,
    required List<CategoryModel> categories,
    required List<SizeModel> sizes,
    required int? currentCategoryId,
    required int? currentSizeId,
    required int? maxPrice,
    required int? minPrice,
    required String? title,
    required HomeStatus? status,
    required bool? orderBy,
  }) = _HomeState;

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


}
