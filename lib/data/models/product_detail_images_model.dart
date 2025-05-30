import 'package:hive/hive.dart';

part 'product_detail_images_model.g.dart';

@HiveType(typeId: 1)
class ProductDetailImagesModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String image;

  ProductDetailImagesModel({required this.id, required this.image});

  factory ProductDetailImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailImagesModel(id: json['id'], image: json['image']);
  }
}
