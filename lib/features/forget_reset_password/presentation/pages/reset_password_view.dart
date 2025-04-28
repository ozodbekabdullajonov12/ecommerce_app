import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_bloc.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_state.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/auth_page_title_and_subtitle.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/store_app_bar_button.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/ecommerce_text_form_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarButton(),
      body: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state.status == ResetPasswordStatus.success) {
            showDialog(
              context: context,
              builder:
                  (context) => SimpleDialog(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24),
                        width: 341.w,
                        height: 292.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/validation_success.svg",
                              width: 59.w,
                              height: 59.h,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Password Changed",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Your can now use your new password to \n login to your account.",
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            EcommerceTextButtonContainer(
                              text: "Login",
                              textColor: Colors.white,
                              containerHeight: 54.h,
                              containerWidth: 293.w,
                              containerColor: AppColors.primary,
                              callback: () => context.go(Routes.login),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: context.read<ResetPasswordBloc>().formKeyPassword,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
              child: Column(
                children: [
                  AuthPageTitleAndSubtitle(
                    title: "Reset Password",
                    subTitle:
                        "Set the new password for your account so you can login and access all the features.",
                  ),
                  SizedBox(height: 24.h),
                  EcommerceTextFormField(
                    label: "Password",
                    hintText: "**********",
                    controller: context.read<ResetPasswordBloc>().passwordController,
                    borderColor: state.passwordBorderColor,
                    validator: context.read<ResetPasswordBloc>().passwordValidator,
                    showPassword: state.showPassword,
                    isPassword: true,
                    showPasswordFunc: () => context.read<ResetPasswordBloc>().add(ShowPassword()),
                  ),
                  EcommerceTextFormField(
                    label: " Confirm Password",
                    hintText: "**********",
                    controller: context.read<ResetPasswordBloc>().cPasswordController,
                    borderColor: state.cPasswordBorderColor,
                    validator: context.read<ResetPasswordBloc>().cPasswordValidator,
                    showPassword: state.cShowPassword,
                    isPassword: true,
                    showPasswordFunc: () => context.read<ResetPasswordBloc>().add(CShowPassword()),
                  ),
                  Spacer(),
                  BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                    builder:
                        (context, state) => SizedBox(
                          width: 341.w,
                          height: 54.h,
                          child: TextButton(
                            onPressed: () {
                              context.read<ResetPasswordBloc>().add(ResetPasswordLogin());
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: AppColors.primary.withValues(
                                alpha:
                                    (state.passwordStatus == TextFormFieldStatus.success &&
                                            state.cPasswordStatus == TextFormFieldStatus.success)
                                        ? 1
                                        : 0.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontFamily: 'General Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
