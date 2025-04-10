class MyCartModel {
  final int id;
  final String name, image;
  final int price;

  MyCartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory MyCartModel.fromJson(Map<String, dynamic> json) {
    return MyCartModel(
      id: json["id"],
      name: json["firstName"],
      image: json["photo"],
      price: json['price'],
    );
  }
}