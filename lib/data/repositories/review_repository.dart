import '../../core/client.dart';
import '../models/review_model.dart';
import '../models/review_stats_model.dart';


class ReviewRepository {
  final ApiClient client;

  List<ReviewModel> reviews = [];

  ReviewRepository({required this.client});

  Future<List<ReviewModel>> fetchReview() async{
    var review = await client.fetchReviews(1);
    reviews = review.map((e) => ReviewModel.fromJson(e)).toList();
    return reviews;
  }

  Future<ReviewStatsModel> fetchReviewStatsModel() async {
    var stats = await client.fetchReviewStats(1);
    return ReviewStatsModel.fromJson(stats);
  }
}