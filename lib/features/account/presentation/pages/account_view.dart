import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/pages/account_view_page.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

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
          AccountViewPage(icon: "assets/icons/box.svg", title: "My Orders",),
          SizedBox(height: 20,),
          Container(width: 390,height: 8.h,color: AppColors.primary100,),
          AccountViewPage(icon: "assets/icons/details.svg", title: "My Details")
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
