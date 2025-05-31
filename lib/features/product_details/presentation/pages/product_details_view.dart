import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import 'package:store/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:store/features/product_details/presentation/manager/product_details_state.dart';
import 'package:store/features/product_details/presentation/widgets/product_details_add_cart.dart';
import 'package:store/features/product_details/presentation/widgets/product_details_item.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});


  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Details",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) => ProductDetailsItem(),
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          var detail = state.productDetails;
          if (state.status == ProductDetailsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == ProductDetailsStatus.error) {
            Center(child: Text("Xatolik"));
          }
          return ProductDetailsAddCart(detail: detail, selectedSize: selectedSize,);

        },
      ),
    );
  }
}
