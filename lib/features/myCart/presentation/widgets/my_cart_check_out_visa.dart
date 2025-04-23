import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';

class MyCartCheckOutVisa extends StatelessWidget {
  const MyCartCheckOutVisa({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: 341.w,
      height: 52.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 10,
        children: [
          SvgPicture.asset("assets/icons/visa.svg", width: 43.w, height: 13.h),
          Text(
            "**** **** **** 2512",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 75),
          SvgPicture.asset("assets/icons/edit.svg"),
        ],
      ),
    );
  }
}
