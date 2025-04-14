import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/product_model.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            products.image,
            height: 122.h,
            width: 161.w,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          products.title,
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.9),
            fontFamily: "General Sans",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          products.price.toString(),
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.5),
            fontWeight: FontWeight.w500,
            fontFamily: "General Sans",
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
