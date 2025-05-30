import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/common/small_product.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/home/presentation/widgets/home_view_app_bar.dart';

import '../../../../core/connection_state.dart';
import '../manager/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionStateCubit, AppConnectionState>(
      listenWhen: (previous, current) {
        if (current.lastOnlineStatus == false && current.isOnline) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        final text = state.isOnline ? "You are in Network" : " You are not in Network";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
      },
      child: Scaffold(
        appBar: HomeViewAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.status == HomeStatus.error) {
              return Center(child: Text("Error"));
            }
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 161.w / 224.h,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) => SmallProduct(product: state.products[index]),
            );
          },
        ),
        bottomNavigationBar: EcommerceBottomNavigationBar(),
      ),
    );
  }
}
