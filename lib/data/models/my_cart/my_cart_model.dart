import 'package:hive/hive.dart';

import 'my_cart_items_model.dart';
@HiveType(typeId: 9)
class MyCartModel {
  @HiveField(0)
  final List<MyCartItemsModel> cartItems;
  @HiveField(1)
  final int subTotal;
  @HiveField(2)
  final int vat;
  @HiveField(3)
  final int shippingFee;
  @HiveField(4)
  final int total;

  MyCartModel({
    required this.cartItems,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });
  factory MyCartModel.fromJson(Map<String, dynamic>json){
    return MyCartModel(cartItems: (json['items'] as List<dynamic>).map((e)=>MyCartItemsModel.fromJson(e)).toList(),
      subTotal: json['subTotal'],
      vat: json['vat'],
      shippingFee: json['shippingFee'],
      total: json['total'],
    );
  }
}