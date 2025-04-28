import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/pages/account_notifications_settings.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

class AccountNotificationsView extends StatelessWidget {
  const AccountNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: EcommerceAppBar(
        title: "Notifications",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        children: [
          Column(
            spacing: 20.h,
            children: [
              Divider(color: AppColors.primary100),
              AccountNotificationsSettings(title: 'General Notifications',),
              AccountNotificationsSettings(title: 'Sound',),
              AccountNotificationsSettings(title: 'Vibrate',),
              AccountNotificationsSettings(title: 'Special Offers',),
              AccountNotificationsSettings(title: 'Promo & Discounts',),
              AccountNotificationsSettings(title: 'Payments',),
              AccountNotificationsSettings(title: 'Cashback',),
              AccountNotificationsSettings(title: 'App Updates',),
              AccountNotificationsSettings(title: 'New Service Available',),
              AccountNotificationsSettings(title: 'New Tips Available',),
            ],
          ),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
