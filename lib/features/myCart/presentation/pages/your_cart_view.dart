import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

import '../../../home/presentation/widgets/ecommerce_app_bar.dart';

class YourCartView extends StatelessWidget {
  const YourCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  EcommerceAppBar(
        title: "My Cart",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
