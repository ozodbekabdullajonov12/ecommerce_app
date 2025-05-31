import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

import '../../../../data/models/product_model.dart';

class HomeViewProductsImageTitle extends StatelessWidget {
  const HomeViewProductsImageTitle({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(products.image,
          width: 161.w,
          height: 174.h,
          fit: BoxFit.cover,),
        ),
        Text(
          products.title,
          style: TextStyle(
              color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          fontFamily: "General Sans"),
        ),
        Row(
          children: [
            SvgPicture.asset("assets/icons/cash.svg"),
            Text(products.price.toString(),
            style: TextStyle(
              color: AppColors.secondary,
              fontFamily: "General Sans",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),)
          ],
        )
      ],
    );
  }
}
