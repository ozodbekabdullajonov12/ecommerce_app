import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class AccountViewPage extends StatelessWidget {
  const AccountViewPage({super.key, required this.icon, required this.title});
  final String icon,title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Column(
        spacing: 10,
        children: [
          Divider(color: AppColors.primary100),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(icon),
              Row(
                spacing: 240,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/chevron.svg"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
