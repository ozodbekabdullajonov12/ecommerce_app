import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/account/presentation/widgets/account_my_details_phone_number.dart';
import 'package:store/features/account/presentation/widgets/account_date_of_birth.dart';
import 'package:store/features/account/presentation/widgets/account_my_details_gender.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/common/ecommerce_text_form_field.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';

import '../../../common/ecommerce_app_bar.dart';

class AccountMyDetailsView extends StatelessWidget {
  AccountMyDetailsView({super.key});

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "My Details",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h),
        children: [
          Divider(color: AppColors.primary100),
          EcommerceTextFormField(
            label: "Full Name",
            hintText: "Cody Fisher",
            controller: fullNameController,
            borderColor: AppColors.primary100,
            validator: (null),
          ),
          EcommerceTextFormField(
            label: "Email Address",
            hintText: "cody.fisher45@example",
            controller: emailController,
            borderColor: AppColors.primary100,
            validator: (null),
          ),
          AccountDateOfBirth(),
          AccountMyDetailsGender(),
          SizedBox(height: 10),
          AccountMyDetailsPhoneNumber(),
          SizedBox(height: 170.h,),
          EcommerceTextButtonContainer(text: "Submit", textColor: Colors.white, containerColor: AppColors.primary, callback: (){}),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
