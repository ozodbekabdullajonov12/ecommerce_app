class ProductDetailsSizeModel {
  final int? id;

  final String? title;

  ProductDetailsSizeModel({required this.id, required this.title});

  factory ProductDetailsSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsSizeModel(id: json["id"], title: json["title"]);
  }
}