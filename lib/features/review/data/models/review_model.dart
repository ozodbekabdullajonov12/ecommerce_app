class ReviewModel {
  final num rating;
  final int reviewCount;
  final String date;

  ReviewModel({
    required this.date,
    required this.rating,
    required this.reviewCount,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      date: json['date'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
    );
  }
}
