import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:store/core/utils/colors.dart';

class AccountDateOfBirth extends StatelessWidget {
  AccountDateOfBirth({super.key});

  final ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);

  Future<void> _pickDate(BuildContext context) async {
    DateTime initialDate = DateTime(2025, 04, 21);
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.utc(1900, 1, 1),
      initialDate: selectedDate.value ?? initialDate,
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primary100, // Tanlovdagi asosiy rang
            onPrimary: Colors.pink,
            surface: Colors.white,
            onSurface: Colors.black,
            secondary: Color(0xFFC45B5B),
            onSecondary: Color(0xFFFEEBE4),
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<DateTime?>(
        valueListenable: selectedDate,
        builder: (context, date, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date of birth",
                style: TextStyle(
                  color:AppColors.primary, // Label rangi
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: Container(
                  width: double.infinity,
                  height: 52.h,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary100)
                  ),
                  child: Text(
                    (date == null)
                        ? "DD/MM/YYYY"
                        : DateFormat("12/07/1990").format(date),
                    style: TextStyle(
                      color: Color(0xFF999999)
                          .withOpacity((date == null) ? 0.6 : 1), // Text rangi
                      fontSize: 16,
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
