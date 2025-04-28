import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_details_model.dart';

enum ProductDetailsStatus { idle, loading, error }

class ProductDetailsState extends Equatable {
  final ProductDetailsModel? productDetails;
  final ProductDetailsStatus status;

  const ProductDetailsState({
    required this.status,
    required this.productDetails,
  });

  @override
  List<Object?> get props => [productDetails, status];

  factory ProductDetailsState.initial() {
    return ProductDetailsState(
      status: ProductDetailsStatus.loading,
      productDetails: null,
    );
  }

  ProductDetailsState copyWith({
    ProductDetailsModel? productDetails,
    ProductDetailsStatus? status,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      productDetails: productDetails ?? this.productDetails,
    );
  }
}
