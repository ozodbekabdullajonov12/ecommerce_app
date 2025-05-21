import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(baseUrl: "http://192.168.8.149:8888/api/v1", validateStatus: (value) => true),
    );
  }

  late final Dio dio;

  Future<dynamic> fetchProject() async {
    var response = await dio.get("project");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("xatolik yuz berdi");
    }
  }
}

class ProjectModel {
  final int id;
  final int catregoyId;
  final String title;
  final String image;

  ProjectModel({
    required this.id,
    required this.catregoyId,
    required this.title,
    required this.image,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      catregoyId: json['catregoyId'],
      title: json['title'],
      image: json['image'],
    );
  }
}
class ProjectRepository{

  final ApiClient client;

  ProjectRepository({required this.client,});

  ProjectModel? projectModel;

  Future<ProjectModel> fetchProject() async{
    var rewProject = await  client.fetchProject();
    projectModel = ProjectModel.fromJson(rewProject);
    return projectModel!;
  }
}

