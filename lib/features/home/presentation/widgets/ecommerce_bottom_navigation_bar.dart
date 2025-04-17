import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';

class EcommerceBottomNavigationBar extends StatelessWidget {
  const EcommerceBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/home.svg"),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      fontSize: 12,
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {context.push(Routes.search);},
                icon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              Text(
                "Search",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/saved.svg"),
              ),
              Text(
                "Saved",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => context.push(Routes.myCart),
                icon: SvgPicture.asset("assets/icons/cart.svg"),
              ),
              Text(
                "Cart",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => context.push(Routes.account),
                icon: SvgPicture.asset(
                  "assets/icons/account.svg",
                  colorFilter: ColorFilter.mode(
                    AppColors.primary.withValues(alpha: 0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Text(
                "Account",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
