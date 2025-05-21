import 'my_cart_items_model.dart';

class MyCartModel {
  final List<MyCartItemsModel> cartItems;
  final int subTotal;
  final int vat;
  final int shippingFee;
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