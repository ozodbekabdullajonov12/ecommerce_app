import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EcommerceTextIconButton extends StatelessWidget {
  const EcommerceTextIconButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.containerColor,
    required this.callback,
    required this.icon,
    this.containerWidth = 300,
    this.containerHeight = 56,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
  });

  final String text, icon;
  final double fontSize;
  final double containerWidth, containerHeight;
  final FontWeight fontWeight;
  final Color textColor, containerColor;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(containerWidth, containerHeight),
        backgroundColor: containerColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      child: Center(
        child: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
                height: 1,
              ),
            ),
            Center(
              child: SvgPicture.asset(
                "assets/icons/$icon",
                width: 14,
                height: 14,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
