import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/features/auth/presentation/widgets/ecommerce_auth_app_bar.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/ecommerce_text_form_field.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

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
          BlocBuilder<SignUpBloc, SignUpState>(
            builder:
                (context, state) => Form(
                  key: context.read<SignUpBloc>().formKey,
                  child: Column(
                    spacing: 20.h,
                    children: [
                      EcommerceTextFormField(
                        label: "Full Name",
                        hintText: "Enter your full name",
                        controller:
                            context.read<SignUpBloc>().fullNameController,
                        borderColor: state.fullNameBorderColor,
                        prefix: state.fullNamePrefix,
                        validator: (value)   =>  context.read<SignUpBloc>().fullNameValidator(value),
                      ),
                      EcommerceTextFormField(
                        label: "Email",
                        hintText: "Enter your email address",
                        controller: context.read<SignUpBloc>().emailController,
                        borderColor: state.emailBorderColor,
                        prefix: state.emailPrefix,
                        validator:
                            (value) => context
                                .read<SignUpBloc>()
                                .emailValidator(value),
                      ),
                      EcommerceTextFormField(
                        label: "Password",
                        hintText: "Enter your password",
                        controller: context.read<SignUpBloc>().passwordController,
                        borderColor: state.passwordBorderColor,
                        prefix: state.passwordPrefix,
                        validator: (value) => context.read<SignUpBloc>().passwordValidator(value),
                        showPassword: state.showPassword,
                        showPasswordFunc: ()  => context.read<SignUpBloc>().add(ShowPassword()),
                      ),
                    ],
                  ),
                ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By signing up you agree to our Terms,",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: " Privacy Policy, ",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "and",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "  Cookie Use",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) => EcommerceTextButtonContainer(
                  text: "Create an account",
                  textColor: Colors.white,
                  containerColor: AppColors.primary.withValues(
                    alpha:
                        (state.passwordStatus != TextFormFieldStatus.success) ? 0.2 : 1,
                  ),
                  callback: () {
                    context.read<SignUpBloc>().add(CreateAnAccount());
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
            text: "Sign Up with Google",
            textColor: Colors.black,
            containerColor: Colors.white,
            callback: () {},
            icon: "google_logo.svg",
          ),
          SizedBox(height: 20.h),
          EcommerceTextIconButton(
            text: "Sign Up with Facebook",
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
                "Already have an account?",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  fontSize: 16,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Log In",
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
