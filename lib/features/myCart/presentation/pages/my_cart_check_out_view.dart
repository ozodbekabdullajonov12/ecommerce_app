import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/store_icon_button.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_check_out_deliver_adress.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_check_out_payment_method.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_check_out_visa.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_view_colculate_price.dart';

import '../../../../core/routing/routes.dart';
import '../../../common/ecommerce_app_bar.dart';

class MyCartCheckOut extends StatelessWidget {
  const MyCartCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Checkout",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.primary200),
              MyCartCheckOutDeliverAdress(),
              SizedBox(height: 10),
              Row(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/map_pin.svg", width: 17.w, height: 21.h),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Text(
                "925 S Chugach St #APT 10, Alaska 99645",
                style: TextStyle(
                  color: AppColors.primary200,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(color: AppColors.primary200),
              Text(
                "Payment Method",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCartCheckOutPaymentMethod(icon: 'card.svg', title: "Card"),
                  MyCartCheckOutPaymentMethod(icon: 'cash.svg', title: "Cash"),
                  MyCartCheckOutPaymentMethod(icon: 'apple_pay.svg', title: ""),
                ],
              ),
              SizedBox(height: 5.h),
              MyCartCheckOutVisa(),
              SizedBox(height: 5.h),
              Divider(color: AppColors.primary200),
              Text(
                "Order Summery",
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              MyCartViewCalculatePrice(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 249.w,
                    height: 52.h,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter promo code",
                        hintStyle: TextStyle(
                          color: AppColors.primary100,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.primary100, width: 1),
                        ),
                      ),
                    ),
                  ),
                  EcommerceTextButtonContainer(
                    text: "Add",
                    textColor: Colors.white,
                    containerColor: AppColors.primary,
                    containerHeight: 52.h,
                    containerWidth: 84.w,
                    callback: () => context.push(Routes.paymentMethod),
                  ),
                ],
              ),
              SizedBox(height: 30),
              EcommerceTextButtonContainer(
                text: 'Place Order',
                containerColor: AppColors.primary,
                textColor: Colors.white,
                containerWidth: 341.w,
                containerHeight: 54.h,
                callback: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
