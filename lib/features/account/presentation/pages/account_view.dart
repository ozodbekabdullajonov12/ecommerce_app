import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/widgets/account_view_details.dart';
import 'package:store/features/account/presentation/widgets/account_view_help_center.dart';
import 'package:store/features/account/presentation/widgets/account_view_logout.dart';
import 'package:store/features/account/presentation/widgets/account_view_page.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

import '../../../common/ecommerce_app_bar.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Account",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        children: [
          AccountViewPage(icon: "assets/icons/box.svg", title: "My Orders"),
          SizedBox(height: 20),
          Container(width: 390, height: 8.h, color: AppColors.primary100),
          SizedBox(height: 15),
          AccountViewDetails(),
          SizedBox(height: 15),
          Container(width: 390, height: 8.h, color: AppColors.primary100),
          SizedBox(height: 15),
          AccountViewHelpCenter(),
          SizedBox(height: 15),
          Container(width: 390, height: 8.h, color: AppColors.primary100),
          SizedBox(height: 20),
          AccountViewLogout(),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
