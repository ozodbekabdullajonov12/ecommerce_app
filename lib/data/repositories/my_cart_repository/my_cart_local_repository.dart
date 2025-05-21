import 'package:hive/hive.dart';
import 'package:store/core/exceptions/custom_exception.dart';
import 'package:store/data/interfaces/my_cart_interface_repository.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';

import '../../models/my_cart/my_cart_model.dart';

class MyCartLocalRepository implements IMyCartRepository{
  final Box<MyCartModel> box = Hive.box<MyCartModel>("myCart");

  @override
  Future<MyCartModel> fetchMyCart() async {
    try {
      final key = "myCart";
      final cart = box.get(key);
      if (cart == null) throw CustomException(message: "No cart found");
      return cart;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}