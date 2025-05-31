import 'package:hive/hive.dart';
import 'package:store/data/models/product_detail_images_model.dart';
import 'package:store/data/models/size_model.dart';
part 'product_details_model.g.dart';

@HiveType(typeId: 2)
class ProductDetailsModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final int? reviewCount;

  @HiveField(5)
  final bool isLiked;

  @HiveField(6)
  final double? rating;

  @HiveField(7)
  final List<ProductDetailImagesModel> images;
  @HiveField(8)
  final List<SizeModel> sizes;

  ProductDetailsModel({
    required this.rating,
    required this.id,
    required this.isLiked,
    required this.price,
    required this.title,
    required this.description,
    required this.reviewCount,
    required this.images,
    required this.sizes,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      rating: json['rating'],
      id: json['id'],
      isLiked: json['isLiked'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      reviewCount: json['reviewCount'],
      images: (json["productImages"] as List<dynamic>).map((e) => ProductDetailImagesModel.fromJson(e)).toList(),
      sizes: (json["productSizes"] as List<dynamic>).map((s) => SizeModel.fromJson(s)).toList(),

    );
  }
}
