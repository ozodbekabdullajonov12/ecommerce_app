import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_bloc.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_state.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/auth_page_title_and_subtitle.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/store_app_bar_button.dart';

class EnterOtpView extends StatelessWidget {
  const EnterOtpView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarButton(),
      body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          return
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthPageTitleAndSubtitle(title: "Enter 4 Digit Code",
                    subTitle: 'Enter 4 digit code that your receive on your \nemail (cody.fisher45@example.com).'),
                SizedBox(height: 24,),
                Center(
                  child: Pinput(length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    errorPinTheme: errorPinTheme,
                    onCompleted: (code)=>context.read<ResetPasswordBloc>().add(VerifyPassword(code: code)),
                  ),
                ),
                SizedBox(height: 16.h,),
                Center(
                  child: RichText(text:
                  TextSpan(
                      text: "Don't receive the code?",
                      style: TextStyle(color: AppColors.primary,
                          fontSize: 14.r),
                      children: [
                        TextSpan(
                            text: "Reset Code",
                            recognizer: TapGestureRecognizer(),
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.r,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline
                            )
                        )
                      ]
                  )
                  ),
                ),
                Spacer(),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  builder:(context, state)=> SizedBox(
                    width: 341.w,
                    height: 54.h,
                    child: TextButton(
                      onPressed: () => context.go(Routes.resetPassword),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.primary,
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
          );
        }
      ),
    );
  }
}


final defaultPinTheme = PinTheme(
  width: 64.w,
  height: 64.h,
  textStyle: TextStyle(
    fontSize: 32,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: AppColors.primary100),
    borderRadius: BorderRadius.circular(10),
  ),
);


final focusedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    border: Border.all(color: AppColors.primary),
  ),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    border: Border.all(color: AppColors.successGreen),
  ),
);

final errorPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    border: Border.all(color: AppColors.error),
  ),
);


