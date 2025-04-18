import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';

import '../../../common/store_icon_button.dart';
import '../../../home/presentation/widgets/ecommerce_app_bar.dart';

class AccountMyOrdersView extends StatelessWidget {
  const AccountMyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "My Orders",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: const Padding(padding: EdgeInsets.all(16.0), child: CustomTabSwitcher()),
    );
  }
}

class CustomTabSwitcher extends StatefulWidget {
  const CustomTabSwitcher({super.key});

  @override
  State<CustomTabSwitcher> createState() => _CustomTabSwitcherState();
}

class _CustomTabSwitcherState extends State<CustomTabSwitcher> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 341.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                alignment: selectedIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  width: 162.w,
                  height: 38.h,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Center(
                        child: Text(
                          "Ongoing",
                          style: TextStyle(
                            color: selectedIndex == 0 ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Center(
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            color: selectedIndex == 1 ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child:
            selectedIndex == 0
                ? ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                  width: 342.w,
                  height: 107.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary100),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              "assets/images/slogan.png",
                              width: 83.w,
                              height: 79.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 98,
                                children: [
                                  Text(
                                    "Regular Fit Slogan",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontFamily: "General Sans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SvgPicture.asset("assets/icons/trash.svg"),
                                ],
                              ),
                              Text(
                                "Size L",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "General Sans",
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "\$1,200",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontFamily: "General Sans",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
                : ListView(
              key: const ValueKey(1),
              children: [
              ],
            ),
          ),
        ),
      ],
    );
  }
}


