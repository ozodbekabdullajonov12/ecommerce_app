import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: [
          Image.asset(
            "assets/images/tshirt.png",
            height: 368.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Text(
            "Regular Fit Slogan",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontFamily: "General Sans",
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            spacing: 5.h,
            children: [
              SvgPicture.asset("assets/icons/star_filled.svg"),
              Text(
                "4.0/5",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                  fontFamily: "General Sans",
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "(45 reviews)",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Decorations",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.5),
              fontSize: 16,
              fontFamily: "General Sans",
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Choose Size",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "General Sans",
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            spacing: 10.h,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "S",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontFamily: "General Sans",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "M",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontFamily: "General Sans",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "L",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        fontFamily: "General Sans",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
