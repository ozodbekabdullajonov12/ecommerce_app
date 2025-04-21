import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class ReviewStarGenerate extends StatelessWidget {
  const ReviewStarGenerate({
    super.key,
    required this.starsCount,
    required this.ratingStarCount,
    required this.totalCount,
  });

  final int starsCount, ratingStarCount, totalCount;

  @override
  Widget build(BuildContext context) {
    final double progressWidth = 220.w;
    final double activeWidth = (ratingStarCount / totalCount) * progressWidth;

    return Row(
      children: [
        Row(
          children: List.generate(
            5,
                (index) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: index < starsCount
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
        SizedBox(width: 5.w),
        Container(
          width: progressWidth,
          height: 5.h,
          child: Row(
            children: [
              Container(
                width: activeWidth,
                height: 5.h,
                color: AppColors.primary.withValues(alpha: 0.9),
              ),
              Container(
                width: progressWidth - activeWidth,
                height: 5.h,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

