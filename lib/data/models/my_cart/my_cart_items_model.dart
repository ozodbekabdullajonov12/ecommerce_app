import 'package:hive/hive.dart';

@HiveType(typeId: 8)
class MyCartItemsModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String size;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final num quantity;

  MyCartItemsModel({
    required this.id,
    required this.title,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory MyCartItemsModel.fromJson(Map<String, dynamic> json) {
    return MyCartItemsModel(
      id: json['id'],
      title: json['title'],
      size: json['size'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }
}

