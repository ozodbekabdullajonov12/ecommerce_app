import 'package:store/data/models/product_detail_images_model.dart';

class ProductDetailsModel {
  final int? id;
  final String? title, description;
  final int? price, reviewCount;
  final bool? isLiked;
  final double? rating;
  //final List<ProductDetailImagesModel>? images;
 // final List<SizeModel>? sizes;

  ProductDetailsModel({
    required this.rating,
    required this.id,
    required this.isLiked,
    required this.price,
    required this.title,
    required this.description,
    required this.reviewCount,
   // required this.images,
    //required this.sizes,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic?> json) {
    return ProductDetailsModel(
      rating: json['rating'],
      id: json['id'],
      isLiked: json['isLiked'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      reviewCount: json['reviewCount'],
      //sizes:
      //    (json["productSizes"] ?? json['productSizes'] as List<dynamic>)
      //        .map((e) => ProductDetailsSizeModel.fromJson(e))
      //        .toList(),
      //images:
       //   (json["productImages"] ?? json['productImages'] as List<dynamic>)
       //       .map((e) => ProductDetailImagesModel.fromJson(e))
       //       .toList(),
    );
  }
}
