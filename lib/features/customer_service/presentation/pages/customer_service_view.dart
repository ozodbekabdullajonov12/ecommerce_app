import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Customer Service",
        actions: [SvgPicture.asset("assets/icons/phone.svg")],
      ),

    );
  }
}
