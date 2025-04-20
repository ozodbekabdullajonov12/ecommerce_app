import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/review/presentation/manager/review/review_bloc.dart';
import 'package:store/features/review/presentation/manager/review/review_state.dart';
import 'package:store/features/review/presentation/widgets/review_star_generate.dart';
import 'package:store/features/review/presentation/widgets/avg_rating_calculator.dart';
import 'package:store/features/review/presentation/widgets/star_generate.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Reviews",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          var stats = state.stats;
          if (state.status == ReviewStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == ReviewStatus.error) {
            Center(child: Text("Xatolik"));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: [
                Divider(color: AppColors.primary100),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AvgRatingCalculator(
                        oneStars: stats!.oneStars,
                        twoStars: stats.twoStars,
                        threeStars: stats.threeStars,
                        fourStars: stats.fourStars,
                        fiveStars: stats.fiveStars,
                      ).calculateAverageRating(),
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                        fontSize: 64,
                        fontFamily: "General Sans",
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child:
                                  index < 5
                                      ? SvgPicture.asset(
                                        "assets/icons/star_filled.svg",
                                      )
                                      : SvgPicture.asset(
                                        "assets/icons/star_filled.svg",
                                        colorFilter: ColorFilter.mode(
                                          AppColors.primary100,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                            ),
                          ),
                        ),
                        Text(
                          "${stats.totalCount} reviews",
                          style: TextStyle(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            fontFamily: "General Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ReviewStarGenerate(
                  starsCount: 5,
                  ratingStarCount: stats.fiveStars,
                  totalCount: stats.totalCount,
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 4,
                  ratingStarCount: state.stats!.fourStars,
                  totalCount: stats.totalCount,
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 3,
                  ratingStarCount: state.stats!.threeStars,
                  totalCount: stats.totalCount,
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 2,
                  ratingStarCount: state.stats!.twoStars,
                  totalCount: stats.totalCount,
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 1,
                  ratingStarCount: state.stats!.oneStars,
                  totalCount: stats.totalCount,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${state.reviews!.length} reviews',
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Most relevant",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    final reviews = state.reviews;
                    if (state.status == ReviewStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (reviews == null || reviews.isEmpty) {
                      return const Text('No reviews yet.');
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        reviews.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 20.h,
                                children: [
                                  StarGenerate(
                                    starsCount: reviews[index].rating as int,
                                  ),
                                  Text(reviews[index].comment),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            reviews[index].userFullName,
                                            style: TextStyle(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.9),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(color: Colors.red,)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
