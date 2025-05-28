import 'package:bloc/bloc.dart';
import 'package:store/data/repositories/product_repositories/product_repository.dart';
import 'package:store/features/saved_items/presentation/manager/saved_items_state.dart';

part 'saved_items_event.dart';

class SavedItemsBloc extends Bloc<SavedItemsEvent, SavedItemsState> {
  final ProductRepository _productRepo;

  SavedItemsBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(SavedItemsState.initial()) {
    on<SavedItemsLoading>(_load);
    on<SavedItemsUnSave>(_unSave);
    add(SavedItemsLoading());
  }

  Future _load(SavedItemsLoading event, Emitter<SavedItemsState> emit) async {
    emit(state.copyWith(status: SavedItemsStatus.loading));
    final products = await _productRepo.fetchSavedProducts();
    emit(state.copyWith(status: SavedItemsStatus.idle, products: products));
  }

  Future _unSave(SavedItemsUnSave event, Emitter<SavedItemsState> emit) async {
    final products = await _productRepo.savedProductsUnSave(productId: event.id);
    emit(state.copyWith(products: products,status: SavedItemsStatus.idle));
  }
}
