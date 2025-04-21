import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/product_details/presentation/pages/product_details_item.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Details",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ProductDetailsItem(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 105.h,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "price",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "General Sans",
                  ),
                ),
                Text(
                  "\$1234",
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    fontFamily: "General Sans",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 240.w,
                height: 54.h,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    spacing: 5.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/add_cart.svg"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
