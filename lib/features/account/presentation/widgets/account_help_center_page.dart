import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class AccountHelpCenterPage extends StatelessWidget {
  const AccountHelpCenterPage({super.key, required this.icon, required this.title});

  final String icon, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: 341.w,
      height: 52.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary100, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 15,
        children: [
          SvgPicture.asset(icon),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primary,
              fontFamily: "General Sans",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
