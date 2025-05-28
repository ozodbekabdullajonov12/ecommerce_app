import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/colors.dart';

class EcommerceTextFormField extends StatelessWidget {
  const EcommerceTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.borderColor,
    required this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.isPassword = false,
    this.suffix,
    this.showPasswordFunc,
    this.showPassword = false,
  });

  final String label, hintText;
  final String? suffix;
  final TextEditingController controller;
  final int minLines, maxLines;
  final bool isPassword;
  final Color borderColor;

  final String? Function(String?)? validator;

  final VoidCallback? showPasswordFunc;

  final bool? showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUnfocus,
          obscureText: isPassword && showPassword != null  ? !showPassword! : false,
          obscuringCharacter: "*",
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            errorStyle: TextStyle(
              color: AppColors.error,
              fontSize: 14,
              fontFamily: "General Sans",
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: isPassword
                ? IconButton(
              onPressed: showPasswordFunc,
              icon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/icons/${showPassword!? "show_password" : "hide_password"}.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(borderColor, BlendMode.srcIn),
                ),
              ),
            )
                : (suffix != null
                ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                "assets/icons/$suffix",
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            )
                : null),

            hintStyle: TextStyle(
              color: Color(0xFF999999),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
