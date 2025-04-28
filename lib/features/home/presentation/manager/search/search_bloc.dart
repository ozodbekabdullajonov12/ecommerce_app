import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/data/models/search_history_model.dart';
import 'package:store/data/repositories/product_repository.dart';
import 'package:store/data/repositories/search_history_repository.dart';
import 'package:store/features/home/presentation/manager/search/search_state.dart';

part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchHistoryRepository _historyRepo;

  final ProductRepository _productRepo;

  final TextEditingController searchController = TextEditingController();

  SearchBloc({
    required ProductRepository productRepo,
    required SearchHistoryRepository historyRepo,
  }) : _historyRepo = historyRepo,
       _productRepo = productRepo,
       super(SearchState.initial()) {
    on<LoadSearchHistory>(_onLoadSearchHistory);
    add(LoadSearchHistory());
    on<PerformSearchHistory>(_performSearch);
    on<ClearAllHistories>(_clearAll);
    on<DeleteSearchHistory>(_deleteSearchHistory);
    on<SearchSearching>(_searching);
  }

  Future<void> _onLoadSearchHistory(
    LoadSearchHistory event,
    Emitter<SearchState> emit,
  ) async {
    final histories = await _getSearchHistories();
    emit(state.copyWith(searchHistories: histories, status: SearchStatus.idle));
  }

  Future _performSearch(
    PerformSearchHistory event,
    Emitter<SearchState> emit,
  ) async {
    if (searchController.text.isNotEmpty &&
        !state.searchHistories.any(
          (element) => element.title == searchController.text,
        )) {
      await _historyRepo.saveSearchHistory(
        search: SearchHistoryModel(title: searchController.text),
      );
    }
    var histories = await _getSearchHistories();
    emit(state.copyWith(searchHistories: histories,));
  }

  Future _clearAll(ClearAllHistories event, Emitter<SearchState> emit) async {
    await _historyRepo.deleteAllSearchHistory();
    var histories = await _getSearchHistories();
    emit(state.copyWith(searchHistories: histories, status: SearchStatus.idle));
  }

  Future _deleteSearchHistory(
    DeleteSearchHistory event,
    Emitter<SearchState> emit,
  ) async {
    await _historyRepo.deleteSearchHistory(
      search: SearchHistoryModel(title: event.text),
    );
    var histories = await _getSearchHistories();
    emit(state.copyWith(searchHistories: histories, status: SearchStatus.idle));
  }

  Future _searching(SearchSearching event, Emitter<SearchState> emit) async {
    var title = searchController.text;
    if (title.length >= 3) {
      emit(state.copyWith(status: SearchStatus.loading, products: []));
      var products = await _productRepo.fetchProducts(
        queryParams: {"Title": title},
      );
      if (products.isNotEmpty) {
        emit(state.copyWith(products: products));
      } else {
        emit(state.copyWith(status: SearchStatus.notFound, products: []));
      }
    } else {
      emit(state.copyWith(status: SearchStatus.idle,));
    }
  }

  Future<List<ProductModel>> _getProducts({required String? title}) async {
    var products = await _productRepo.fetchProducts(
      queryParams: {"Title": title ?? ""},
    );
    return products;
  }

  Future<List<SearchHistoryModel>> _getSearchHistories() async {
    var searches=await _historyRepo.getSearchHistories();
    return searches;
  }
}
