import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/size_model.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key, required this.sizes});

  final List<SizeModel> sizes;

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  bool orderBy = true;

  RangeValues currentPrices = RangeValues(0, 4000);
  int? _sizeId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 64.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  orderBy = true;
                  _sizeId = null;
                  currentPrices = RangeValues(0, 4000);
                  context.pop(
                    HomeApplyFilters(
                      maxPrice: null,
                      minPrice: null,
                      sizeId: null,
                      orderBy: null,
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  "assets/icons/cancel.svg",
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(
            "Sorted By",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:
                    () => setState(() {
                      orderBy = true;
                    }),
                child: Container(
                  width: 163.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: (orderBy) ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          (orderBy) ? Colors.transparent : AppColors.primary100,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Price:Low-High",
                      style: TextStyle(
                        color: (orderBy) ? Colors.white : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap:
                    () => setState(() {
                      orderBy = false;
                    }),
                child: Container(
                  width: 163.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: (!orderBy) ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          (!orderBy)
                              ? Colors.transparent
                              : AppColors.primary100,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Price:Low-High",
                      style: TextStyle(
                        color: (!orderBy) ? Colors.white : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ 0 - ",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\$ 4000",
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          RangeSlider(
            values: currentPrices,
            divisions: 4000,
            min: 0,
            max: 4000,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.primary200,

            labels: RangeLabels(
              currentPrices.start.round().toString(),
              currentPrices.end.round().toString(),
            ),
            onChanged:
                (value) => setState(() {
                  currentPrices = value;
                }),
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              DropdownMenu<int>(
                inputDecorationTheme: InputDecorationTheme(
                  constraints: BoxConstraints.tight(Size(100, 35)),
                  border: InputBorder.none,

                ),
                dropdownMenuEntries: List.generate(
                  widget.sizes.length,
                  (index) => DropdownMenuEntry(
                    value: widget.sizes[index].id,
                    label: widget.sizes[index].title,
                  ),
                ),
                onSelected:
                    (int? value) => setState(() {
                      _sizeId = value;
                    }),
                menuStyle: MenuStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
                menuHeight: 320.h,
              ),
            ],
          ),
          EcommerceTextButtonContainer(
            text: "Apply Filters",
            textColor: Colors.white,
            containerColor: AppColors.primary,
            callback: () {
              context.pop(
                HomeApplyFilters(
                  sizeId: _sizeId,
                  orderBy: orderBy,
                  minPrice: currentPrices.start.toInt(),
                  maxPrice: currentPrices.end.toInt(),
                ),
              );
            },
            containerWidth: 341.w,
            containerHeight: 54.h,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
