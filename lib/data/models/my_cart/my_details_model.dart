class MyDetailsModel {
  final int id;
  final String fullName;
  final String email;
  final num phoneNumber;
  final String gender;
  final DateTime dateTime;

  MyDetailsModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateTime,
  });

  factory MyDetailsModel.fromJson(Map<String, dynamic> json) {
    return MyDetailsModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      dateTime: json['birthDate'],
    );
  }
}
