import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_app_bar.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Reviews",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
    );
  }
}
