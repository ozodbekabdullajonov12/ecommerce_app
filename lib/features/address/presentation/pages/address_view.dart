import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';

class AddressView extends StatefulWidget {
  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: EcommerceAppBar(
        title: "Address",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ...List.generate(
              4,
              (index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 76,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              selectedIndex == index
                                  ? AppColors.primary
                                  : AppColors.primary100,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/location.svg"),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            if (selectedIndex == index)
                              Icon(Icons.check_circle, color: AppColors.primary)
                            else
                              Icon(
                                Icons.radio_button_unchecked,
                                color: AppColors.primary100,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                context.push(Routes.addAddress);
              },
              child: Container(
                width: double.infinity,
                height: 54.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: AppColors.primary100),
                ),
                child: Center(
                  child: Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/add_location.svg"),
                      Text(
                        "Add New Address",
                        style: TextStyle(
                          color: AppColors.primary.withValues(alpha: 0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: EcommerceTextButtonContainer(
          text: "Apply",
          textColor: Colors.white,
          containerColor: Colors.black,
          callback: () {},
        ),
      ),
    );
  }
}
