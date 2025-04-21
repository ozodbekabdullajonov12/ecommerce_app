import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/store_icon_button.dart';

class AccountViewLogout extends StatelessWidget {
  const AccountViewLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        children: [
          Row(
            spacing: 12,
            children: [
              StoreIconButton(
                icon: "assets/icons/logout.svg",
                width: 18.w,
                height: 18.h,
                callback: () {},
              ),
              Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
