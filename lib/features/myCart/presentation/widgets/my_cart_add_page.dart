import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/models/my_cart/my_cart_items_model.dart';
import 'package:store/features/common/store_icon_button.dart';

class MyCartAddPage extends StatelessWidget {
  const MyCartAddPage({super.key, required this.item,});
  final MyCartItemsModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: 342.w,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  item.image,
                  width: 83.w,
                  height: 79.h,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 98,
                    children: [
                      Text(
                      item.title,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontFamily: "General Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/trash.svg"),
                    ],
                  ),
                  Text(
                    "Size ${item.size}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: "General Sans",
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    spacing: 119,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$ ${item.price}",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontFamily: "General Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            width: 24.w,
                            height: 23.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary100),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                              child: StoreIconButton(icon: "assets/icons/minus.svg", width: 10.w, height: 2.h, callback: (){}),
                            ),
                          ),
                          Text(
                            item.quantity.toString(),
                            style: TextStyle(
                              color: AppColors.primary,
                              fontFamily: "General Sans",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 24.w,
                            height: 23.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primary100),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                              child: StoreIconButton(icon: "assets/icons/add.svg", width: 10.w, height: 10.h, callback: (){})

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
