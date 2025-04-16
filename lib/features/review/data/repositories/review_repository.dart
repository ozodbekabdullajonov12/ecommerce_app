import 'package:store/core/client.dart';
import 'package:store/features/review/data/models/review_model.dart';

class ReviewRepository {
  final ApiClient client;
  List<ReviewModel> reviews = [];
  ReviewRepository({required this.client});

  Future<List> fetchReviews() async {
    var reviews = await client.fetchReviews();
    reviews = reviews.map((e) => ReviewModel.fromJson(e)).toList();
    return reviews;
  }
}