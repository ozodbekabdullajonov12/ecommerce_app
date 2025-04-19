import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';

class StarGenerate extends StatelessWidget {
  const StarGenerate({super.key, required this.starsCount});

  final int starsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            starsCount,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: SvgPicture.asset("assets/icons/star_filled.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
