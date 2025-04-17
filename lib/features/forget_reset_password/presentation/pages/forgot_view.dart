import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/ecommerce_text_form_field.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_bloc.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_state.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/auth_page_title_and_subtitle.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/store_app_bar_button.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarButton(),
      body: BlocBuilder<ResetPasswordBloc,ResetPasswordState>(
        builder:  (context, state) {
          return
          Form(
            key: context.read<ResetPasswordBloc>().formKeyEmail,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthPageTitleAndSubtitle(title: 'Forgot Password',
                    subTitle: 'Enter your email for the verification process.\nWe will send 4 digits code to your email.',),
                  SizedBox(height: 20),
                  EcommerceTextFormField(
                    label: "Email",
                    hintText: "cody.fisher45@example.com",
                    controller: context.read<ResetPasswordBloc>().emailController,
                    borderColor: state.emailBorderColor,
                    suffix: state.emailSuffix,
                    validator: context.read<ResetPasswordBloc>().emailValidator
                  ),
                  Spacer(),
                  Center(
                    child: EcommerceTextButtonContainer(text: "Send Code",
                        textColor: Colors.white,
                        containerColor: AppColors.primary.withValues(
                          alpha: (state.emailStatus == TextFormFieldStatus.success ) ? 1 : 0.2,
                        ), callback: () => context.read<ResetPasswordBloc>().add(SendEmail())
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
