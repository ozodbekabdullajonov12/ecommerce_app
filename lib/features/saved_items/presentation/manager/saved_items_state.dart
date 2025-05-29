import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/product_model.dart';

part 'saved_items_state.freezed.dart';

enum SavedItemsStatus { idle, loading, error, notFound }

@freezed
abstract class SavedItemsState with _$SavedItemsState {
  const factory SavedItemsState({
    required List<ProductModel> products,
    required SavedItemsStatus? status,
  }) = _SavedItemsState;

  factory SavedItemsState.initial(){
    return SavedItemsState(products: [], status: SavedItemsStatus.loading,);
  }
}
