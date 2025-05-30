import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

import '../../../../data/models/product_model.dart';

class SearchViewProducts extends StatelessWidget {
  const SearchViewProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          products.map((product) {
            return Column(
              children: [
                ListTile(
                  title: Row(
                    spacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          fit: BoxFit.cover,
                          height: 53.h,
                          width: 56.w,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.primary.withValues(alpha: 0.9),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${product.price} ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.primary.withValues(alpha: 0.9),
                                ),
                              ),
                              (product.discount!=0)   ?  Text(
                                "-${product.discount}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ):SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: SvgPicture.asset("assets/icons/to_product.svg"),
                    onPressed: () {},
                  ),
                ),
                Divider(
                  // Add divider here
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
                SizedBox(height: 6.h),
              ],
            );
          }).toList(),
    );
  }
}
