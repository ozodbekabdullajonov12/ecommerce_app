import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/saved_items/presentation/manager/saved_items_bloc.dart';
import 'package:store/features/saved_items/presentation/manager/saved_items_state.dart';
import 'package:store/features/saved_items/presentation/widgets/saved_product.dart';

import '../../../../core/routing/routes.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Saved Products",
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/notification.svg"),
            onPressed: () {
              context.push(Routes.notifications);
            },
          ),
        ],
      ),
      bottomNavigationBar: EcommerceBottomNavigationBar(),
      body: BlocBuilder<SavedItemsBloc, SavedItemsState>(
        builder: (context, state) {
          if (state.status == SavedItemsStatus.loading) {
            return RefreshIndicator(
              onRefresh: () async => context.read<SavedItemsBloc>().add(SavedItemsLoading()),
              child: Center(
                child: SizedBox(width: 200, height: 200, child: CircularProgressIndicator()),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async => context.read<SavedItemsBloc>().add(SavedItemsLoading()),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 161.w / 174.h,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) => SavedProduct(product: state.products[index]),
              ),
            );
          }
        },
      ),
    );
  }
}
