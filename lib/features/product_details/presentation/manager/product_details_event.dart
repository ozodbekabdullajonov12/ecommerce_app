part of "product_details_bloc.dart";

sealed class ProductDetailsEvent {}

final class ProductDetailsLoading extends ProductDetailsEvent {}

final class ProductDetailAddProduct extends ProductDetailsEvent{
  final int productId;
  final int sizeId;

  ProductDetailAddProduct({required this.productId, required this.sizeId});
}