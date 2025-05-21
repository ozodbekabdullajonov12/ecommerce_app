class MyCartItemsModel {
  final int id;
  final String title;
  final String size;
  final int price;
  final String image;
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

