import 'package:bloc/bloc.dart';
import 'package:store/features/product_details/presentation/manager/product_details_state.dart';

import '../../../../data/repositories/product_repositories/product_repository.dart';
part 'product_details_event.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository _repo;
  final int productId;

  ProductDetailsBloc({required ProductRepository repo,required this.productId})
    : _repo = repo,
      super(ProductDetailsState.initial()) {
    on<ProductDetailsLoading>(_loading);
    on<ProductDetailAddProduct>(_addProduct);
    add(ProductDetailsLoading());
  }

  Future<void> _loading(ProductDetailsLoading event, Emitter emit,) async {
    emit(state.copyWith(status: ProductDetailsStatus.loading));
    final details = await _repo.fetchProductDetail(productId);
    final sizes = await _repo.fetchSizes();
    sizes.sort((a,b) => a.id.compareTo(b.id));
    emit(state.copyWith(productDetails: details, sizes: sizes, status: ProductDetailsStatus.success));
  }
  Future<void> _addProduct(ProductDetailAddProduct event, Emitter<ProductDetailsState> emit) async{
    await _repo.addProduct(productId: event.productId, sizeId: event.sizeId);
  }
}
