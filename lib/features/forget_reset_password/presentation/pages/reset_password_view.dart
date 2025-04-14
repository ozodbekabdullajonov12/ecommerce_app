import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
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
      body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder:(context, state){
          return
          Form(
            key: context.read<ResetPasswordBloc>().formKeyPassword,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
              child: Column(
                children: [
                  AuthPageTitleAndSubtitle(title: "Reset Password", subTitle: "Set the new password for your account so you can login and access all the features."),
                  SizedBox(height: 24.h,),
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
                      label: "Password",
                      hintText: "**********",
                      controller:context.read<ResetPasswordBloc>().cPasswordController,
                      borderColor: state.cPasswordBorderColor,
                      validator: context.read<ResetPasswordBloc>().cPasswordValidator,
                    showPassword: state.cShowPassword,
                    isPassword: true,
                    showPasswordFunc: () => context.read<ResetPasswordBloc>().add(CShowPassword()),
                  ),
                  Spacer(),
                  BlocBuilder<ResetPasswordBloc,ResetPasswordState>(
                    builder:(context, state)=> SizedBox(
                      width: 341.w,
                      height: 54.h,
                      child: TextButton(
                        onPressed: () {
                          // context.read<ResetPasswordBloc>()
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primary.withValues(alpha: (state.passwordStatus == TextFormFieldStatus.success && state.cPasswordStatus == TextFormFieldStatus.success)
                          ? 1
                          : 0.2
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
