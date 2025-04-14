import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';

import '../../../../core/utils/colors.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
          title: "Saved Items",
          actions: [SvgPicture.asset("assets/icons/notification.svg")]
      ),
      body: ListView(
        children: [
        Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/tshirt.png",
              height: 122.h,
              width: 161.w,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Regular fit slogan",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.9),
              fontFamily: "General Sans",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "\$1200",
            style: TextStyle(
              color: AppColors.primary.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
              fontFamily: "General Sans",
              fontSize: 12,
            ),
          ),
        ],
      )
        ],
      ),
    );
  }
}
