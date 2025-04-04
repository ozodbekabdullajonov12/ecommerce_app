import 'package:flutter/material.dart';

class EcommerceTextFormField extends StatelessWidget {
  const EcommerceTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String label, hintText;
  final TextEditingController controller;
  final int minLines, maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        TextFormField(
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF999999),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF808080)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}