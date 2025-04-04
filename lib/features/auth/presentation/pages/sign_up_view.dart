import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/common/ecommerce_auth_app_bar.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/ecommerce_text_form_field.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAuthAppBar(
        title: "Create an account",
        titleDesc: "Let's create your account",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          Form(
            child: Column(
              spacing: 20.h,
              children: [
                EcommerceTextFormField(
                  label: "Full Name",
                  hintText: "Enter your name",
                  controller: fullNameController,
                ),
                EcommerceTextFormField(
                  label: "Email",
                  hintText: "Enter your email address",
                  controller: emailController,
                ),
                EcommerceTextFormField(
                  label: "Password",
                  hintText: "Enter your password",
                  controller: passwordController,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By signing up you agree to our Terms,",
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: " Privacy Policy, ",
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "and",
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "  Cookie Use",
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          EcommerceTextButtonContainer(
            text: "Create an account",
            textColor: Color(0xFFFFFFFF),
            containerColor: Color(0xFFCCCCCC),
            callback: () {},
          ),
          SizedBox(height: 20),
          Row(
            spacing: 5,
            children: [
              Container(
                width: 154.w,
                height: 1,
                color: Color(0xFFE6E6E6),
              ),
              Text(
                "or",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF808080),
                ),
              ),
              Container(
                width: 154,
                height: 1,
                color: Color(0xFFE6E6E6),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            child: Container(
              height: 56.h,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Text(
                  "data",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
