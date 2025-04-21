import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class SavedItemsPage extends StatelessWidget {
  const SavedItemsPage({super.key, required this.image, required this.title, required this.price});
  final String image, title;
  final int  price;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
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
          "$price".toString(),
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
