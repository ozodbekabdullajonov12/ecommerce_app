import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AccountNotificationsSettings extends StatefulWidget {
  const AccountNotificationsSettings({super.key, required this.title});

  final String title;

  @override
  State<AccountNotificationsSettings> createState() => _AccountNotificationsSettingsState();
}

class _AccountNotificationsSettingsState extends State<AccountNotificationsSettings> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          FlutterSwitch(
            width: 45.w,
              height: 22.h,
              borderRadius: 40,
              padding: 2.0,
              activeColor: AppColors.primary,
              inactiveColor: AppColors.primary100,
              value: status,
              onToggle: (val) {
          setState(() {
            status = val;
          });
              }
              ),
        ],
      ),
      SizedBox(height: 15.h,),
      Divider(color: AppColors.primary100,)
    ]
    );
  }
  }
