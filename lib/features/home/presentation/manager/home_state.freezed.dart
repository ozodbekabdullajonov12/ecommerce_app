// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<ProductModel> get products; List<CategoryModel> get categories; List<SizeModel> get sizes; int? get currentCategoryId; int? get currentSizeId; int? get maxPrice; int? get minPrice; String? get title; HomeStatus? get status; bool? get orderBy;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.currentSizeId, currentSizeId) || other.currentSizeId == currentSizeId)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderBy, orderBy) || other.orderBy == orderBy));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(sizes),currentCategoryId,currentSizeId,maxPrice,minPrice,title,status,orderBy);

@override
String toString() {
  return 'HomeState(products: $products, categories: $categories, sizes: $sizes, currentCategoryId: $currentCategoryId, currentSizeId: $currentSizeId, maxPrice: $maxPrice, minPrice: $minPrice, title: $title, status: $status, orderBy: $orderBy)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products, List<CategoryModel> categories, List<SizeModel> sizes, int? currentCategoryId, int? currentSizeId, int? maxPrice, int? minPrice, String? title, HomeStatus? status, bool? orderBy
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? categories = null,Object? sizes = null,Object? currentCategoryId = freezed,Object? currentSizeId = freezed,Object? maxPrice = freezed,Object? minPrice = freezed,Object? title = freezed,Object? status = freezed,Object? orderBy = freezed,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<SizeModel>,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as int?,currentSizeId: freezed == currentSizeId ? _self.currentSizeId : currentSizeId // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus?,orderBy: freezed == orderBy ? _self.orderBy : orderBy // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required final  List<ProductModel> products, required final  List<CategoryModel> categories, required final  List<SizeModel> sizes, required this.currentCategoryId, required this.currentSizeId, required this.maxPrice, required this.minPrice, required this.title, required this.status, required this.orderBy}): _products = products,_categories = categories,_sizes = sizes;
  

 final  List<ProductModel> _products;
@override List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<CategoryModel> _categories;
@override List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<SizeModel> _sizes;
@override List<SizeModel> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}

@override final  int? currentCategoryId;
@override final  int? currentSizeId;
@override final  int? maxPrice;
@override final  int? minPrice;
@override final  String? title;
@override final  HomeStatus? status;
@override final  bool? orderBy;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.currentSizeId, currentSizeId) || other.currentSizeId == currentSizeId)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderBy, orderBy) || other.orderBy == orderBy));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_sizes),currentCategoryId,currentSizeId,maxPrice,minPrice,title,status,orderBy);

@override
String toString() {
  return 'HomeState(products: $products, categories: $categories, sizes: $sizes, currentCategoryId: $currentCategoryId, currentSizeId: $currentSizeId, maxPrice: $maxPrice, minPrice: $minPrice, title: $title, status: $status, orderBy: $orderBy)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> products, List<CategoryModel> categories, List<SizeModel> sizes, int? currentCategoryId, int? currentSizeId, int? maxPrice, int? minPrice, String? title, HomeStatus? status, bool? orderBy
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? categories = null,Object? sizes = null,Object? currentCategoryId = freezed,Object? currentSizeId = freezed,Object? maxPrice = freezed,Object? minPrice = freezed,Object? title = freezed,Object? status = freezed,Object? orderBy = freezed,}) {
  return _then(_HomeState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<SizeModel>,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as int?,currentSizeId: freezed == currentSizeId ? _self.currentSizeId : currentSizeId // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus?,orderBy: freezed == orderBy ? _self.orderBy : orderBy // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
