import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';

class MyCartNewCardDate extends StatelessWidget {
  const MyCartNewCardDate({super.key, required this.title, required this.label});
  final String title, label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: "General Sans"
          ),
        ),
        SizedBox(
          width: 165.w,
          height: 52.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(
                color: AppColors.primary100,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                  fontFamily: "General Sans"
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary100, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
