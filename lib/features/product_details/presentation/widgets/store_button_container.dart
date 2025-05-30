import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';

class StoreButtonContainer extends StatelessWidget {
  const StoreButtonContainer({super.key, required this.size, required this.callback, this.textColor, this.buttonColor});

  final String size;
  final VoidCallback callback;
  final Color? textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 50.w,
        height: 47.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: textColor,
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
