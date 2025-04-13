import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/home/data/models/product_model.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.products});

  final List<ProductModel>? products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: products!.length,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        products![index].image,
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
                          products![index].isLiked == true;
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
                                  products![index].isLiked
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
                  products![index].title,
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
                      "\$${products![index].price}",
                      style: TextStyle(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "General Sans",
                      ),
                    ),
                    if (products![index].discount > 1)
                      Text(
                        "-${products![index].discount}%",
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
          ),
    );
  }
}
