part of "home_bloc.dart";
sealed class HomeEvent {}

final class HomeLoading extends HomeEvent {}

final class CurrentCategory extends HomeEvent {
  final int id;

  CurrentCategory({required this.id});
}

final class HomeSearch extends HomeEvent {}

final class HomeSaveOrUnSave extends HomeEvent {
  final int id;
  final bool isLiked;

  HomeSaveOrUnSave({required this.isLiked, required this.id});
}

final class HomeApplyFilters extends HomeEvent {
  final int? sizeId;

  final bool? orderBy;

  final int? minPrice, maxPrice;

  HomeApplyFilters({
    required this.sizeId,
    required this.orderBy,
    required this.minPrice,
    required this.maxPrice,
  });
}


final class HomeClearFilters extends HomeEvent{}