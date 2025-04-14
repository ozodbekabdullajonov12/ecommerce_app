import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_model.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductModel>? products;
  final HomeStatus? status;

  const HomeState({required this.status, required this.products});

  @override
  List<Object?> get props => [products, status];

  factory HomeState.initial() {
    return HomeState(status: HomeStatus.loading, products: []);
  }

  HomeState copyWith({
    List<ProductModel>? products,
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

}
