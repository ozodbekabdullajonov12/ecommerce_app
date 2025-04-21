import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class EcommerceTextButtonContainer extends StatelessWidget {
  const EcommerceTextButtonContainer({
    super.key,
    required this.text,
    required this.textColor,
    required this.containerColor,
    required this.callback,
    this.containerWidth = 300,
    this.containerHeight = 56,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.borderColor = AppColors.primary100,
    this.radius = 10,
  });

  final String text;
  final double fontSize;
  final double containerWidth, containerHeight;
  final FontWeight fontWeight;
  final Color textColor, containerColor;
   final Color borderColor;
   final double radius;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
        fixedSize: Size(containerWidth, containerHeight),
        backgroundColor: containerColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: 1,
        ),
      ),
    );
  }
}