import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';

class EcommerceAuthAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EcommerceAuthAppBar({
    super.key,
    required this.title,
    required this.titleDesc,
  });

  final String title;
  final String titleDesc;

  @override
  Size get preferredSize => const Size(double.infinity, 61);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            Text(
              titleDesc,
              style: TextStyle(
                color: AppColors.primary.withValues(alpha: 0.5),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
