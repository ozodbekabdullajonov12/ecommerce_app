import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Divider(color: AppColors.primary100),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "4.0",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                    fontSize: 64,
                    fontFamily: "General Sans",
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: SvgPicture.asset(
                            "assets/icons/star_filled.svg",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "1234 reviews",
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
            ReviewStarGenerate(starsCount: 5),
            SizedBox(height: 5.h),
            ReviewStarGenerate(starsCount: 4),
            SizedBox(height: 5.h),
            ReviewStarGenerate(starsCount: 3),
            SizedBox(height: 5.h),
            ReviewStarGenerate(starsCount: 2),
            SizedBox(height: 5.h),
            ReviewStarGenerate(starsCount: 1),
            SizedBox(height: 10.h),
            Divider(color: AppColors.primary.withValues(alpha: 0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ReviewCOunt",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "General Sans",
                  ),
                ),
                Text(
                  "Most relevant",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    fontFamily: "General Sans",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Column(
              spacing: 15.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child:
                          index < 5
                              ? SvgPicture.asset("assets/icons/star_filled.svg")
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
                  "Review",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "General Sans",
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      "Warren Buffet",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontFamily: "General Sans",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "6 days Ago",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        fontFamily: "General Sans",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
