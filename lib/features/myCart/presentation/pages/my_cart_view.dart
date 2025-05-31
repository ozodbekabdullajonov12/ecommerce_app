import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';
import 'package:store/features/common/ecommerce_text_icon_button.dart';
import 'package:store/features/home/presentation/widgets/ecommerce_bottom_navigation_bar.dart';
import 'package:store/features/myCart/presentation/manager/my_cart_bloc.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_add_page.dart';
import 'package:store/features/myCart/presentation/widgets/my_cart_view_colculate_price.dart';

import '../../../common/ecommerce_app_bar.dart';
import '../manager/my_cart_state.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartBloc, MyCartState>(
      builder: (context, state) {
        if (state.status == MyCartStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }else if (state.status == MyCartStatus.error) {
          return Center(child: Text("Error"));
        }else if (state.myCart == null) {
          return Center(child: Text("Malumot topilmadi"));
        }
        return
        Scaffold(
            appBar: EcommerceAppBar(
              title: "My Cart",
              actions: [SvgPicture.asset("assets/icons/notification.svg")],
            ),
            body: ListView.builder(
                itemCount:state.myCart!.cartItems.length,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      MyCartAddPage(item: state.myCart!.cartItems[index],),
                      SizedBox(height: 20),
                      MyCartViewCalculatePrice(),
                      SizedBox(height: 350),
                      EcommerceTextIconButton(
                        text: "Go To Checkout",
                        textColor: Colors.white,
                        containerColor: AppColors.primary,
                        callback: () => context.push(Routes.checkout),
                        icon: "go_arrow.svg",
                      ),
                    ],
                  );
                }
            ),

            bottomNavigationBar: EcommerceBottomNavigationBar()

        );
      }
    );
  }
}