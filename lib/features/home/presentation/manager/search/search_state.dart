import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:store/data/models/search_history_model.dart';

import '../../../../../data/models/product_model.dart';

enum SearchStatus { idle, loading, notFound,error,starting}

@immutable
class SearchState extends Equatable {
  final List<SearchHistoryModel> searchHistories;
  final List<ProductModel> products;
  final SearchStatus status;

  const SearchState({
    required this.searchHistories,
    required this.products,
    required this.status,
  });


  SearchState copyWith({
    List<SearchHistoryModel>? searchHistories,
    List<ProductModel>? products,
    SearchStatus? status,
  }) {
    return SearchState(
      searchHistories: searchHistories ?? this.searchHistories,
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  factory SearchState.initial() {
    return SearchState(
      searchHistories: [],
      products: [],
      status: SearchStatus.starting,
    );
  }

  @override
  List<Object?> get props => [searchHistories, products, status];
}
