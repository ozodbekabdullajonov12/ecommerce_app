import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/auth_page_title_and_subtitle.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/store_app_bar_button.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/ecommerce_text_form_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordControllerOne = TextEditingController();
  final passwordControllerTwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarButton(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
          child: Column(
            children: [
              AuthPageTitleAndSubtitle(title: "Reset Password", subTitle: "Set the new password for your account so you can login and access all the features."),
              SizedBox(height: 24.h,),
              EcommerceTextFormField(
                label: "Password",
                hintText: "**********",
                controller: passwordControllerOne,
                borderColor: AppColors.primary100,
                validator: (null),
                prefix: "hide_password.svg"),
              EcommerceTextFormField(
                label: "Password",
                hintText: "**********",
                controller: passwordControllerTwo,
                borderColor: AppColors.primary100,
                validator: (null),
                  prefix: "hide_password.svg"
              ),
              Spacer(),
              SizedBox(
                width: 341.w,
                height: 54.h,
                child: TextButton(
                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
