import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class AuthPageTitleAndSubtitle extends StatelessWidget {
  const AuthPageTitleAndSubtitle({super.key, required this.title, required this.subTitle});

  final String title , subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 32,
            fontFamily: 'General Sans',
          ),
        ),
        Text(
          subTitle,
          maxLines: 2,
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'General Sans',
          ),
        ),
      ],
    );
  }
}
