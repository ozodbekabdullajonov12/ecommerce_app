import 'package:equatable/equatable.dart';
import 'package:store/data/models/review_stats_model.dart';
import '../../../../../data/models/review_model.dart';

enum ReviewStatus { idle, loading, error }

class ReviewState extends Equatable {
  final List<ReviewModel>? reviews;
  final ReviewStatsModel? stats;
  final ReviewStatus? status;

  const ReviewState({
    required this.status,
    required this.reviews,
    required this.stats,
  });

  @override
  List<Object?> get props => [reviews, status, stats];

  factory ReviewState.initial() {
    return ReviewState(status: ReviewStatus.loading, reviews: [], stats: null);
  }

  ReviewState copyWith({
    List<ReviewStatsModel>? products,
    ReviewStatus? status,
  }) {
    return ReviewState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      stats: stats ?? this.stats,
    );
  }
}
