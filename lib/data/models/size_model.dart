import 'package:hive/hive.dart';

part 'size_model.g.dart';

@HiveType(typeId: 6)
class SizeModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  SizeModel({required this.id, required this.title});

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(id: json["id"], title: json["title"]);
  }
}
