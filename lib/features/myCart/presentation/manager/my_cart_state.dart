import 'package:equatable/equatable.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';

import '../../../../data/models/my_cart/my_cart_model.dart';

enum MyCartStatus { idle, loading, success, error }

class MyCartState extends Equatable {
  final MyCartModel? myCart;

  final MyCartStatus status;

  const MyCartState({required this.myCart, required this.status});

  factory MyCartState.initial() => const MyCartState(myCart: null, status: MyCartStatus.idle);

  MyCartState copyWith({MyCartModel? myCart, MyCartStatus? status}) {
    return MyCartState(myCart: myCart ?? this.myCart, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [myCart,status];

}

