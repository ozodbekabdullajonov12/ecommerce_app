import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/review/presentation/manager/review/review_bloc.dart';
import 'package:store/features/review/presentation/manager/review/review_state.dart';
import 'package:store/features/review/presentation/pages/review_star_generate.dart';

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
                      '${state.stats!.twoStars}',
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
                          "${stats!.totalCount} reviews",
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
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 4,
                  ratingStarCount: state.stats!.fourStars
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 3,
                  ratingStarCount: state.stats!.threeStars
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 2,
                  ratingStarCount: state.stats!.twoStars
                ),
                SizedBox(height: 5.h),
                ReviewStarGenerate(
                  starsCount: 1,
                  ratingStarCount: state.stats!.oneStars,
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.primary.withValues(alpha: 0.1)),
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    final reviews = state.reviews;
                    if (reviews == null || reviews.isEmpty) {
                      return const Text('No reviews yet.');
                    }
                    if (state.status == ReviewStatus.loading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Row(children: [Text(reviews[0].comment)]);
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
