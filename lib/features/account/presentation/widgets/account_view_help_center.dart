import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';

import '../../../common/store_icon_button.dart';

class AccountViewHelpCenter extends StatelessWidget {
  const AccountViewHelpCenter({super.key});

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
              SvgPicture.asset("assets/icons/faq.svg"),
              SizedBox(width: 1),
              Expanded(
                child: Text(
                  "FAQs",
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
          Divider(color: AppColors.primary100, height: 1, indent: 43),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/headphones.svg"),
              SizedBox(width: 1),
              Expanded(
                child: Text(
                  "Help Center",
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
                callback: () => context.push(Routes.helpCenter),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
