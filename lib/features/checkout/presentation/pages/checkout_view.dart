import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Checkout",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery address",
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.9),
                fontFamily: "General Sans",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Change",
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.9),
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: "General Sans",
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
