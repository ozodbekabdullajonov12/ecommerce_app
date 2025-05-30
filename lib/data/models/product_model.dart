import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 4)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String title;

  @HiveField(3)
  bool isLiked;

  @HiveField(4)
  final int price;

  @HiveField(5)
  final int discount;
  @HiveField(6)
  final int categoryId;

  ProductModel({
    required this.price,
    required this.title,
    required this.id,
    required this.image,
    required this.discount,
    required this.isLiked,
    required this.categoryId
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      image: json['image'],
      discount: json['discount'],
      isLiked: json['isLiked'],
      categoryId: json["categoryId"]
    );
  }
}
