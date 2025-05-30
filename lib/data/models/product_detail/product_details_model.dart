import 'package:store/data/models/product_detail/product_detail_images_model.dart';
import 'package:store/data/models/product_detail/product_details_size_model.dart';
import 'package:store/data/models/size_model.dart';

class ProductDetailsModel {
  final int id;
  final String title, description;
  final int price;
  final int reviewCount;
  final bool isLiked;
  final double? rating;
  final List<ProductDetailImagesModel> images;
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
      reviewCount: json['reviewsCount'],
      images: (json["productImages"] as List<dynamic>).map((e) => ProductDetailImagesModel.fromJson(e)).toList(),
      sizes: (json["productSizes"] as List<dynamic>).map((s) => SizeModel.fromJson(s)).toList(),
    );
  }
}
