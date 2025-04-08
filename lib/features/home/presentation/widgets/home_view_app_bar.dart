import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeViewAppBar({super.key});

  List<String> type = ["All", "TShirts", "Jeans", "Shorts", "Shoes"];

  @override
  Size get preferredSize => const Size(double.infinity, 170);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.9),
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/notification.svg"),
            onPressed: () {
              context.push(Routes.notifications);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.search);
                    },
                    child: Container(
                      width: 282.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/icons/search.svg"),
                          Text(
                            "Search for clothes...",
                            style: TextStyle(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              fontWeight: FontWeight.w400,
                              fontFamily: "General Sans",
                              fontSize: 16,
                            ),
                          ),
                          SvgPicture.asset("assets/icons/microphone.svg"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 52.w,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/filters.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: type.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 36.h,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              type[index],
                              style: TextStyle(
                                color: AppColors.primary.withValues(alpha: 0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "General sans",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 40.w),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
