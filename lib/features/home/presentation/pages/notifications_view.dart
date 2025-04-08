import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Notifications",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/no_notification.svg"),
            Text(
              "You haven't gotten any notifications yet",
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.9),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "General Sans",
              ),
            ),
            Text(
              "We’ll alert you when something cool happens.",
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.4),
                fontFamily: "General Sans",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
