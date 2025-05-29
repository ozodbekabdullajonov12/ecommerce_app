import 'package:bloc/bloc.dart';
import 'package:store/data/repositories/product_repositories/product_repository.dart';
import 'package:store/features/product_details/presentation/manager/product_details_state.dart';
part 'product_details_event.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository _repo;
  final int productId;

  ProductDetailsBloc({required ProductRepository repo,required this.productId})
    : _repo = repo,
      super(ProductDetailsState.initial()) {
    on<ProductDetailsLoading>(_loading);
    add(ProductDetailsLoading());
  }

  Future<void> _loading(ProductDetailsLoading event, Emitter emit,) async {
    emit(state.copyWith(status: ProductDetailsStatus.loading));
    final details = await _repo.fetchProductDetail(productId);
    emit(
      ProductDetailsState(
        status: ProductDetailsStatus.idle,
        productDetails: details,
      ),
    );
  }
}
