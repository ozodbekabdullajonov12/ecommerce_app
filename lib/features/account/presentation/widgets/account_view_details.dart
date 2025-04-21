import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/store_icon_button.dart';

class AccountViewDetails extends StatelessWidget {
  const AccountViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/details.svg"),
              SizedBox(width: 1),
              Expanded(
                child: Text(
                  "My Details",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              StoreIconButton(
                icon: "assets/icons/chevron.svg",
                width: 10.w,
                height: 11.h,
                callback: () {},
              ),
            ],
          ),
          Divider(color: AppColors.primary100,height: 1, indent: 43),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/address.svg"),
              SizedBox(width: 9.w),
              Expanded(
                child: Text(
                  "Address Book",
                  style: TextStyle(
                    color: AppColors.primary,
                    // fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              StoreIconButton(
                icon: "assets/icons/chevron.svg",
                width: 10.w,
                height: 11.h,
                callback: () {},
              ),
            ],
          ),
          Divider(color: AppColors.primary100,height: 1, indent: 43),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/payment.svg"),
              SizedBox(width: 1.w
              ),
              Expanded(
                child: Text(
                  "Payment Methods",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              StoreIconButton(
                icon: "assets/icons/chevron.svg",
                width: 10.w,
                height: 11.h,
                callback: () {},
              ),
            ],
          ),
          Divider(color: AppColors.primary100,height: 1, indent: 43),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/notification.svg"),
              SizedBox(width: 1.w
              ),
              Expanded(
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              StoreIconButton(
                icon: "assets/icons/chevron.svg",
                width: 10.w,
                height: 11.h,
                callback: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
