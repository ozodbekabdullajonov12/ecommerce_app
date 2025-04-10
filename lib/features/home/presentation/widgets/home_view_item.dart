import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/tshirt.png",
            height: 122.h,
            width: 161.w,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Regular fit slogan",
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.9),
            fontFamily: "General Sans",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          "\$1200",
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.5),
            fontWeight: FontWeight.w500,
            fontFamily: "General Sans",
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
