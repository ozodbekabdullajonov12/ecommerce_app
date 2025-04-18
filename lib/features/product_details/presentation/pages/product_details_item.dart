import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class ProductDetailsItem extends StatelessWidget {
   ProductDetailsItem({super.key});

  // List of image assets
  List<String> images = ["assets/images/tshirt.png", "assets/images/tshirt.png","assets/images/tshirt.png","assets/images/tshirt.png","assets/images/tshirt.png"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(images.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Image.asset(images[index],width: 341.w,height: 368.h,fit: BoxFit.cover,),
                );
              }),
            ),
          ),
          SizedBox(height: 10.h),

          // Product Title
          Text(
            "Regular Fit Slogan",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontFamily: "General Sans",
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SvgPicture.asset("assets/icons/star_filled.svg"),
              SizedBox(width: 5.w),
              Text(
                "4.0/5",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                  fontFamily: "General Sans",
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                "(45 reviews)",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Decorations Text
          Text(
            "Decorations",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.5),
              fontSize: 16.sp,
              fontFamily: "General Sans",
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),

          // Choose Size Text
          Text(
            "Choose Size",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              fontFamily: "General Sans",
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildSizeOption("S"),
              buildSizeOption("M"),
              buildSizeOption("L"),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildSizeOption(String size) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 47.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontFamily: "General Sans",
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
