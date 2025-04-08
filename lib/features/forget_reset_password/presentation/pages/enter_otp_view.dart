import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/auth_page_title_and_subtitle.dart';
import 'package:store/features/forget_reset_password/presentation/widgets/store_app_bar_button.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key});

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(numOfDigits,(_) =>FocusNode());
    controllers = List.generate(numOfDigits, (_)=>TextEditingController());
  }
  Color getBackgroundColor(){
    for(var controller in controllers){
      if (controller.text.isEmpty) {
        return AppColors.primary200;
      }
    }
    return AppColors.primary;
  }
  final int numOfDigits = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarButton(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 14, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthPageTitleAndSubtitle(title: "Enter 4 Digit Code", subTitle: 'Enter 4 digit code that your receive on your \nemail (cody.fisher45@example.com).'),
              SizedBox(height: 24,),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  List.generate(numOfDigits, (index)=> TextFormField(
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 32.r,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp(r"[0-9]"),
                          allow: true,
                      )
                    ],
                    onChanged: (value){
                      if (value.isNotEmpty && index != numOfDigits -1) {
                        focusNodes[index + 1].requestFocus();
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints.tight(Size(64.w,60.h)),
                      counter: SizedBox.shrink(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary100),
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
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
