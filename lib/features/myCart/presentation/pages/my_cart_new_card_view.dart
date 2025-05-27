import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_new_card_date.dart';

import '../../../common/ecommerce_app_bar.dart';


class NewCardView extends StatelessWidget {
  const NewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Payment Method",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Divider(color: AppColors.primary100, height: 1),
            Text(
              "Add Debit or Credit Card",
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              "Card number",
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 16),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your card number",
                hintStyle: TextStyle(
                  color: AppColors.primary100,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary100, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCartNewCardDate(title: 'Expiry Date', label: "MM/YY"),
                MyCartNewCardDate(title: 'Security Date', label: "CVC"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: EcommerceTextButtonContainer(
          text: "Add Card",
          textColor: Colors.white,
          containerColor: AppColors.primary,
          containerHeight: 54.h,
          containerWidth: 341.w,
          callback: () {
            showDialog(context: context, builder: (context)=>
                SimpleDialog(
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      width: 341.w,
                      height: 270.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        spacing: 5,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/validation_success.svg",
                            width: 59.w,
                            height: 59.h,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Password Changed",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Your new card has been added.",
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 50,),
                          EcommerceTextButtonContainer(
                            text: "Thanks",
                            textColor: Colors.white,
                            containerColor: AppColors.primary,
                            containerWidth: 293.w,
                            containerHeight: 54.h,
                            callback: () {context.go(Routes.paymentMethod);},
                            borderColor: AppColors.primary100,
                            radius: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
