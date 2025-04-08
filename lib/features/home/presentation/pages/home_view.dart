import 'package:flutter/material.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/home/presentation/widgets/home_view_app_bar.dart';
import 'package:store/features/home/presentation/widgets/home_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [HomeViewItem(), HomeViewItem()],
        ),
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
