import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(9)),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      height: 174.h,
                      width: 161.w,
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                            color: Colors.black,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: Colors.red),
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
                            "assets/icons/${(!product.isLiked)?"heart.svg":"heart_filled.svg"}",
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
