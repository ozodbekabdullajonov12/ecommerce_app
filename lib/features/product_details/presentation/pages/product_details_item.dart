import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:store/features/product_details/presentation/manager/product_details_state.dart';
import 'package:store/features/product_details/presentation/pages/store_button_container.dart';

class ProductDetailsItem extends StatefulWidget {
  const ProductDetailsItem({super.key});

  @override
  State<ProductDetailsItem> createState() => _ProductDetailsItemState();
}

class _ProductDetailsItemState extends State<ProductDetailsItem> {
  int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        var detail = state.productDetails;
        if (state.status == ProductDetailsStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.status == ProductDetailsStatus.error) {
          Center(child: Text("Xatolik"));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(detail!.images.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Image.network(
                        detail.images[index].image,
                        width: 341.w,
                        height: 368.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                detail.title as String,
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/star_filled.svg"),
                  SizedBox(width: 5.w),
                  Text(
                    "${detail.rating?.toStringAsFixed(1)}/5",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                      fontFamily: "General Sans",
                      fontSize: 16.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "${detail.reviewCount}",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "${detail.description}",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  fontSize: 16.sp,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Choose Size",
                style: TextStyle(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: "General Sans",
                ),
              ),
              SizedBox(height: 10.h),
              // SizedBox(
              //   width: 50,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: detail!.sizes.length,
              //     itemBuilder:
              //         (context, index) => Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             StoreButtonContainer(size: detail.sizes[index].title,
              //             callback: (){
              //               setState(() {
              //                  selectedSize = index;
              //               });
              //             },
              //               textColor: selectedSize == index
              //                   ? Colors.white
              //                   : AppColors.primary,
              //               buttonColor: selectedSize == index
              //                   ? AppColors.primary
              //                   : Colors.white,
              //             ),
              //           ],
              //         ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
