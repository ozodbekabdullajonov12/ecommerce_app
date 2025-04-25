import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/colors.dart';

class EcommerceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EcommerceAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.toolbarHeight = 72,
    required this.actions,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  final List<Widget>? actions;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
        bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {context.pop();},
            icon: SvgPicture.asset("assets/icons/back-arrow.svg"),
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.9),
            fontFamily: "General Sans",
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
        bottom: bottom,
      ),
    );
  }
}
