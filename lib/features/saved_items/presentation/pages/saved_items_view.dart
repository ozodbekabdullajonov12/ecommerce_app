import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/features/saved_items/presentation/pages/saved_items_page.dart';

import '../../../common/ecommerce_app_bar.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "Saved Items",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavedItemsPage(image: "assets/images/tshirt.png",title: "Regular fir slogan",price: 1200,),
                SavedItemsPage(image: "assets/images/tshirt.png",title: "Regular fir slogan",price: 1200,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavedItemsPage(image: "assets/images/tshirt.png",title: "Regular fir slogan",price: 1200,),
                SavedItemsPage(image: "assets/images/tshirt.png",title: "Regular fir slogan",price: 1200,),
              ],
            ),
            SavedItemsPage(image: "assets/images/tshirt.png",title: "Regular fir slogan",price: 1200,),
          ]),
    );
  }
}
