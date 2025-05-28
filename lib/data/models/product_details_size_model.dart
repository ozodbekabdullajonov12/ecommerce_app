import 'package:hive/hive.dart';

part 'product_details_size_model.g.dart';

@HiveType(typeId: 3)
class ProductDetailsSizeModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  ProductDetailsSizeModel({required this.id, required this.title});

  factory ProductDetailsSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsSizeModel(id: json["id"], title: json["title"]);
  }
}
