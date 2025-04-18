import 'package:bloc/bloc.dart';
import 'package:store/data/repositories/review_repository.dart';
import 'package:store/features/review/presentation/manager/review/review_state.dart';
part 'review_event.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository _repo;

  ReviewBloc({
   required ReviewRepository repo
}): _repo = repo,
  super(ReviewState.initial()) {
    on<ReviewLoading>(_loading);
    add(ReviewLoading());
  }

  Future<void> _loading(ReviewLoading event, Emitter emit) async {
    emit(state.copyWith(status: ReviewStatus.loading));
    final  reviews = await _repo.fetchReview();
    final stats = await _repo.fetchReviewStatsModel();
    emit(ReviewState(status: ReviewStatus.idle, reviews: reviews,stats: stats));
  }
}