
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/repositories/product_repository.dart';
import 'package:store/features/home/presentation/manager/home_state.dart';
import 'package:store/main.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _repo;

  final TextEditingController searchController = TextEditingController();


  HomeBloc({required ProductRepository repo})
      : _repo = repo,
        super(HomeState.initial()) {
    on<HomeLoading>(_loading);
    on<CurrentCategory>(_currentCategory);
    on<HomeSearch>(_search);
    on<HomeSaveOrUnSave>(_saveOrUnSave);
    on<HomeApplyFilters>(_applyFilters);
    on<HomeClearFilters>(_clearFilters);
    add(HomeLoading());
  }

  Future<void> _loading(HomeLoading event, Emitter emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await _repo.fetchProducts();
    final categories = await _repo.fetchCategories();
    final sizes = await _repo.fetchSizes();
    emit(
      state.copyWith(
        products: products,
        categories: categories,
        sizes: sizes,
        status: HomeStatus.idle,
      ),
    );
  }

  Future<void> _currentCategory(CurrentCategory event,
      Emitter<HomeState> emit,) async {
    emit(
      state.copyWith(status: HomeStatus.loading, currentCategoryId: event.id),
    );
    var products = await _products(state: state);
    emit(state.copyWith(products: products, status: HomeStatus.idle));
  }

  Future _search(HomeSearch event, Emitter<HomeState> emit) async {
    if (searchController.text.length > 3) {
      var title = searchController.text;
      final products = await _products(state: state.copyWith(title: title));
      emit(
        state.copyWith(
          title: title,
          products: products,
          status: HomeStatus.idle,
        ),
      );
    } else {
      final products = await _products(state: state.copyWith(title: ""));
      emit(
        state.copyWith(status: HomeStatus.idle, products: products, title: ""),
      );
    }
  }

  Future _saveOrUnSave(HomeSaveOrUnSave event, Emitter<HomeState> emit) async {
    if (event.isLiked) {
      await _repo.unSave(productId: event.id);
    } else {
      await _repo.save(productId: event.id);
    }
    emit(state.copyWith(status: HomeStatus.loading));
    var products = await _products(state: state);
    emit(state.copyWith(products: products, status: HomeStatus.idle));
  }


  Future _applyFilters(HomeApplyFilters event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        status: HomeStatus.loading,
        maxPrice: event.maxPrice,
        minPrice: event.minPrice,
        currentSizeId: event.sizeId,
        orderBy: event.orderBy
    ));
    final products=await _products(state: state);
    emit(state.copyWith(status: HomeStatus.idle,products: products,));
  }

  Future _clearFilters(HomeClearFilters event, Emitter<HomeState> emit) async {
    emit(
        state.copyWith(
            status: HomeStatus.loading,
            maxPrice: null,
            minPrice: null,
            currentSizeId: null,
            orderBy: null
        ));
    final products=await _products(state: state);
    emit(state.copyWith(status: HomeStatus.idle,products: products,));
  }

  Future<List<ProductModel>> _products({required HomeState state}) async {
    final products = await _repo.fetchProducts(
      queryParams: {
        "Title": state.title ?? "",
        "CategoryId": state.currentCategoryId ?? "",
        "SizeId": state.currentSizeId ?? "",
        "MinPrice": state.minPrice ?? "",
        "MaxPrice": state.maxPrice ?? "",
        "OrderBy": (state.orderBy!) ? "price" : "-price",
      },
    );
    return products;
  }
}
