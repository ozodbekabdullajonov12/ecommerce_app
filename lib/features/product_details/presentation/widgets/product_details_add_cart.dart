import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/product_detail/product_details_model.dart';
import 'package:store/features/product_details/presentation/manager/product_details_bloc.dart';

class ProductDetailsAddCart extends StatelessWidget {
  const ProductDetailsAddCart({super.key, required this.detail, required this.selectedSize});

  final ProductDetailsModel? detail;
  final int selectedSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105.h,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "price",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "General Sans",
                ),
              ),
              Text(
                "\$${detail!.price}",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontFamily: "General Sans",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<ProductDetailsBloc>().add(
                ProductDetailAddProduct(
                  productId: detail!.id,
                  sizeId: selectedSize,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product Added"), duration: Duration(seconds: 3),
                ),
              );
            },
            child: Container(
              width: 240.w,
              height: 54.h,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  spacing: 5.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SvgPicture.asset("assets/icons/add_cart.svg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
