import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class MyCartViewCalculatePrice extends StatelessWidget {
  const MyCartViewCalculatePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sub-total",
              style: TextStyle(
                color: AppColors.primary200,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "5,870",
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "VAT (%)",
              style: TextStyle(
                color: AppColors.primary200,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "0.00",
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping fee",
              style: TextStyle(
                color: AppColors.primary200,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "80",
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Divider(color: AppColors.primary100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "5.950",
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
