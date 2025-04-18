class SizeModel {
  final int id;

  final String title;

  SizeModel({required this.id, required this.title});

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(id: json["id"], title: json["title"]);
  }
}
