import 'package:bloc/bloc.dart';
import 'package:store/features/home/data/repositories/home_repository.dart';
import 'package:store/features/home/presentation/manager/home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repo;

  HomeBloc({required HomeRepository repo})
    : _repo = repo,
      super(HomeState.initial()) {
    on<HomeLoading>(_loading);
    add(HomeLoading());
  }

  Future<void> _loading(HomeLoading event, Emitter emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await _repo.fetchProducts();
    emit(HomeState(status: HomeStatus.idle, products: products));
  }
}
