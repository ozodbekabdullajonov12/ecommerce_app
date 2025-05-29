import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/ecommerce_text_button_container.dart';

class NewCardViewBottomNavigationbar extends StatelessWidget {
  final VoidCallback onSubmit;
  final bool isLoading;

  const NewCardViewBottomNavigationbar({
    super.key,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: EcommerceTextButtonContainer(
        text: isLoading ? "Please wait..." : "Add Card",
        textColor: Colors.white,
        containerColor: AppColors.primary,
        containerHeight: 54.h,
        containerWidth: 341.w,
        callback: isLoading ? null : onSubmit, // ← endi ishlashi kerak
      ),
    );
  }
}
