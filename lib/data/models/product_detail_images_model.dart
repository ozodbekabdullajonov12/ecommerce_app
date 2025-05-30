class ProductDetailImagesModel {
  final int id;
  final String image;

  ProductDetailImagesModel({required this.id, required this.image});

  factory ProductDetailImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailImagesModel(id: json['id'], image: json['image']);
  }
}
