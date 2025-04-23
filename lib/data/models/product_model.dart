class ProductModel {
  final int id;
  final String image;
  final String title;
  final bool isLiked;
  final int price;
  final int discount;

  ProductModel({
    required this.price,
    required this.title,
    required this.id,
    required this.image,
    required this.discount,
    required this.isLiked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      image: json['image'],
      discount: json['discount'],
      isLiked: json['isLiked'],
    );
  }
}
