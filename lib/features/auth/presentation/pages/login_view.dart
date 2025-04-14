import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:store/features/auth/presentation/manager/login/login_state.dart';
import 'package:store/features/auth/presentation/widgets/ecommerce_auth_app_bar.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/ecommerce_text_form_field.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';

import '../manager/sign_up/sign_up_state.dart';

class  LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAuthAppBar(
        title: "Login to your account",
        titleDesc: "It’s great to see you again.",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder:
                (context, state) => Form(
              key: context.read<LoginBloc>().formKey,
              child: Column(
                spacing: 20.h,
                children: [
                  EcommerceTextFormField(
                    label: "Email",
                    hintText: "Enter your email address",
                    controller: context.read<LoginBloc>().emailController,
                    borderColor: state.emailBorderColor,
                    suffix: state.emailSuffix,
                    validator: context.read<LoginBloc>().emailValidator,
                  ),
                  EcommerceTextFormField(
                    label: "Password",
                    hintText: "Enter your password",
                    controller:
                    context.read<LoginBloc>().passwordController,
                    borderColor: state.passwordBorderColor,
                    isPassword: true,
                    validator: context.read<LoginBloc>().passwordValidator,
                    showPassword: state.showPassword,
                    showPasswordFunc: () => context.read<LoginBloc>().add(ShowPassword()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Forgot Your Password?",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  fontSize: 16,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {context.push(Routes.forgotPassword);
                  },
                child: Text(
                  "Reset Your Password",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          BlocBuilder<LoginBloc, LoginState>(
            builder:
                (context, state) => EcommerceTextButtonContainer(
              text: "Login",
              textColor: Colors.white,
              containerColor: AppColors.primary.withValues(
                alpha:
                (state.passwordStatus == TextFormFieldStatus.success  && state.emailStatus ==
                        TextFormFieldStatus.success)
                    ? 1
                    : 0.2,
              ),
              callback: () {
                context.read<LoginBloc>().add(LoginUser());
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            spacing: 5,
            children: [
              Container(
                width: 154.w,
                height: 1,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
              Text(
                "or",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
              Container(
                width: 154.w,
                height: 1,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          EcommerceTextIconButton(
            text: "Log In with Google",
            textColor: Colors.black,
            containerColor: Colors.white,
            callback: () {},
            icon: "google_logo.svg",
          ),
          SizedBox(height: 20.h),
          EcommerceTextIconButton(
            text: "Login  with Facebook",
            textColor: Colors.white,
            containerColor: Color(0xff1877F2),
            callback: () {},
            icon: "facebook_logo.svg",
          ),
          SizedBox(height: 45.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  fontSize: 16,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.go(Routes.signUp);
                },
                child: Text(
                  "Join",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
