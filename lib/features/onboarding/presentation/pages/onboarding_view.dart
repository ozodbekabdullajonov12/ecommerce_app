import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                height: 0.8,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                fontSize: 64,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/onboarding.png",
              width: 358.w,
              height: 697.h,
              fit: BoxFit.fitWidth,
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 107.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          child: EcommerceTextButtonContainer(
            text: "Get started",
            textColor: Colors.white,
            containerColor: Colors.black,
            callback: () => context.go(Routes.signUp),
          ),
        ),
      ),
    );
  }
}
