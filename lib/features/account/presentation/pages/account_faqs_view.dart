import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/pages/account_faqs_scroll_direction.dart';

import '../../../common/ecommerce_app_bar.dart';

class AccountFaqsView extends StatelessWidget {
  const AccountFaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "FAQs",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        children: [
          Divider(color: AppColors.primary100),
          AccountFaqsScrollDirection(),
        ],
      ),
    );
  }
}
