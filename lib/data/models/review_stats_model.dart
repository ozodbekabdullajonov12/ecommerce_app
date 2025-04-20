
class ReviewStatsModel {
  final int totalCount, fiveStars, fourStars, threeStars, twoStars, oneStars;

  ReviewStatsModel({
    required this.totalCount,
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStars,
  });

  factory ReviewStatsModel.fromJson(Map<String, dynamic> json) {
    return ReviewStatsModel(
      totalCount: json["totalCount"],
      fiveStars: json['fiveStars'],
      fourStars: json['fourStars'],
      threeStars: json['threeStars'],
      twoStars: json["twoStars"],
      oneStars: json['oneStars'],
    );
  }
}
