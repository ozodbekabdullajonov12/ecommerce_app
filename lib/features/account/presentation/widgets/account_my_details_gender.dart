import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';

class AccountMyDetailsGender extends StatelessWidget {
  AccountMyDetailsGender({super.key});

  final ValueNotifier<String> selectedGender = ValueNotifier("Male");

  final List<String> genderOptions = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder<String>(
          valueListenable: selectedGender,
          builder: (context, value, _) {
            return Container(
              height: 52.h,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: genderOptions.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: const TextStyle(
                        fontSize: 16,
                        color:  Color(0xFF999999)
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  selectedGender.value = newValue!;
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
