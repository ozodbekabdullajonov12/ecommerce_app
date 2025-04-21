class ReviewModel {
  final int id;
  final num rating;
  final String  comment;
  final String userFullName;
  final String created;

  ReviewModel({
    required this.id,
    required this.userFullName,
    required this.comment,
    required this.created,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      created: json['created'],
      rating: json['rating'],
      userFullName: json['userFullName'],
      comment: json['comment'],
    );
  }
}
