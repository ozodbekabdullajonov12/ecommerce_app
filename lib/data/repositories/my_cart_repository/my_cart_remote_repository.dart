import 'package:hive/hive.dart';
import 'package:store/core/client.dart';
import 'package:store/data/interfaces/my_cart_interface_repository.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';

import '../../models/my_cart/my_cart_model.dart';

class MyCartRemoteRepository implements IMyCartRepository{
  final ApiClient client;

  MyCartRemoteRepository({
    required this.client
});

  @override
  Future<MyCartModel> fetchMyCart() async{
    final Box<MyCartModel> box = Hive.box<MyCartModel>("myCart");
    final rawMyCart = await client.fetchMyCart();
    final myCart = MyCartModel.fromJson(rawMyCart);

    await box.put("myCart", myCart);
    return myCart;
  }
}