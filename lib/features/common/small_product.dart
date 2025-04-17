import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/data/models/product_model.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';
import 'package:store/features/home/presentation/manager/home_state.dart';

import '../../core/utils/colors.dart';

class SmallProduct extends StatelessWidget {
  const SmallProduct({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder:
          (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image,
                      width: 161.w,
                      height: 174.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(
                          HomeSaveOrUnSave(
                            isLiked: product.isLiked,
                            id: product.id,
                          ),
                        );
                      },
                      child: Container(
                        height: 34.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/heart.svg",
                            colorFilter:
                                product.isLiked
                                    ? ColorFilter.mode(
                                      Colors.red,
                                      BlendMode.srcIn,
                                    )
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                product.title,
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontFamily: "General Sans",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: "General Sans",
                    ),
                  ),
                  if (product.discount !=0)
                    Text(
                      "-${product.discount}%",
                      style: TextStyle(
                        color: Color(0xFFED1010),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "General Sans",
                      ),
                    ),
                ],
              ),
            ],
          ),
    );
  }
}
