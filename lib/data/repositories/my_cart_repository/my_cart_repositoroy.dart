import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store/core/client.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';
import 'package:store/data/repositories/my_cart_repository/my_cart_local_repository.dart';
import 'package:store/data/repositories/my_cart_repository/my_cart_remote_repository.dart';

import '../../models/my_cart/my_cart_model.dart';

class MyCartRepository{
  final MyCartLocalRepository local;
  final MyCartRemoteRepository remote;
  MyCartRepository({required this.local, required this.remote});

  Future<MyCartModel> fetchMyCart() async{
    final result = await Connectivity().checkConnectivity();
    final isOnline = result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await remote.fetchMyCart();
    } else{
      return await local.fetchMyCart();
    }
  }
}