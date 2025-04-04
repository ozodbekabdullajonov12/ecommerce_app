import 'package:flutter/material.dart';

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
  });

  final String text;
  final double fontSize;
  final double containerWidth, containerHeight;
  final FontWeight fontWeight;
  final Color textColor, containerColor;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
        fixedSize: Size(containerWidth, containerHeight),
        backgroundColor: containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
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