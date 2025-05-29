import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_detail/product_details_size_model.dart';
import 'package:store/data/models/size_model.dart';

import '../../../../data/models/product_detail/product_details_model.dart';

enum ProductDetailsStatus { idle, loading, error, success }

class ProductDetailsState extends Equatable {
  final ProductDetailsModel? productDetails;
  final ProductDetailsStatus status;
  final List<SizeModel> sizes;

  const ProductDetailsState({
    required this.status,
    required this.productDetails,
    required this.sizes,
  });

  @override
  List<Object?> get props => [productDetails,sizes,status];

  factory ProductDetailsState.initial() {
    return ProductDetailsState(
      status: ProductDetailsStatus.loading,
      productDetails: null,
      sizes: []
    );
  }

  ProductDetailsState copyWith({
    ProductDetailsModel? productDetails,
    List<SizeModel>? sizes,
    ProductDetailsStatus? status,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      sizes: sizes  ?? this.sizes,
      productDetails: productDetails ?? this.productDetails,
    );
  }
}
