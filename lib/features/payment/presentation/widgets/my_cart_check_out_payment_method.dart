import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';

class MyCartCheckOutPaymentMethod extends StatelessWidget {
  const MyCartCheckOutPaymentMethod({super.key, required this.icon, required this.title});
  final String  icon, title;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 109.w,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Row(
        spacing: 8,
        children: [
          Center(child: SvgPicture.asset("assets/icons/$icon")),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
