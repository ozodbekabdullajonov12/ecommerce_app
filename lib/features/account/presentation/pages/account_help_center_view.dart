import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/account/presentation/widgets/account_help_center_page.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import '../../../common/ecommerce_app_bar.dart';

class AccountHelpCenterView extends StatelessWidget {
  const AccountHelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Help Center",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () => context.push(Routes.customerService),
                child: AccountHelpCenterPage(
                  icon: "assets/icons/headphones.svg",
                  title: "Custom Service",
                ),
              ),
              AccountHelpCenterPage(icon: "assets/icons/whatsapp.svg", title: "Whatsapp"),
              AccountHelpCenterPage(icon: "assets/icons/website.svg", title: "Website"),
              AccountHelpCenterPage(icon: "assets/icons/facebook.svg", title: "Facebook"),
              AccountHelpCenterPage(icon: "assets/icons/twitter.svg", title: "Twitter"),
              AccountHelpCenterPage(icon: "assets/icons/instagram.svg", title: "Instagram"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
