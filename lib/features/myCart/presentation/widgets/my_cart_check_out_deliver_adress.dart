import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class MyCartCheckOutDeliverAdress extends StatelessWidget {
  const MyCartCheckOutDeliverAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Delivery Address",
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: "General Sans",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          "Change",
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: "General Sans",
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
