import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_add_page.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_view_colculate_price.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "My Cart",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          MyCartAddPage(),
          SizedBox(height: 20),
          MyCartViewCalculatePrice(),
          SizedBox(height: 350),
          EcommerceTextIconButton(
            text: "Go To Checkout",
            textColor: Colors.white,
            containerColor: AppColors.primary,
            callback: () => context.push(Routes.checkout),
            icon: "go_arrow.svg",
          ),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar()
    );
  }
}
