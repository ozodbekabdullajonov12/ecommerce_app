import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class ReviewStarGenerate extends StatelessWidget {
  const ReviewStarGenerate({super.key, required this.starsCount});

  final int starsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child:
                  index < starsCount
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
        SizedBox(width: 5.h),
        Container(
          width: 220.w,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
