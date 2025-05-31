import 'package:store/data/models/my_cart/my_cart_items_model.dart';

import '../models/my_cart/my_cart_model.dart';

abstract interface class IMyCartRepository{
  Future<MyCartModel> fetchMyCart();
}