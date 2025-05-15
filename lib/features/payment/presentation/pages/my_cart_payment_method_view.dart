import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';

import '../../../common/ecommerce_app_bar.dart';


class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Payment Method",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: AppColors.primary200),
            Text(
              "Saved Cards",
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 16),
            // CARD 1
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: 341.w,
              height: 52.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/visa.svg", width: 43.w, height: 13.h),
                  SizedBox(width: 12.w),
                  Text(
                    "**** **** **** 2512",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 8.w),
                  Radio<int>(
                    value: 0,
                    groupValue: selectedIndex,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: 341.w,
              height: 52.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/mastercard.svg", width: 43.w, height: 13.h),
                  SizedBox(width: 12.w),
                  Text(
                    "**** **** **** 5421",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 8.w),
                  Radio<int>(
                    value: 1,
                    groupValue: selectedIndex,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            EcommerceTextButtonContainer(
              text: "Add New Card",
              textColor: AppColors.primary,
              containerColor: Colors.white,
              containerWidth: 341.w,
              containerHeight: 54.h,
              callback: () {context.push(Routes.newCard);},
              borderColor: AppColors.primary100,
              radius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
