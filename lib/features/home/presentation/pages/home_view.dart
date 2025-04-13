import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';
import 'package:store/features/home/presentation/pages/home_item.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/home/presentation/widgets/home_view_app_bar.dart';

import '../manager/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final products = state.products;
          if (state.status == HomeStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.error) {
            Center(child: Text("Error"));
          }
          return HomeItem(products: products);
        },
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
    );
  }
}
