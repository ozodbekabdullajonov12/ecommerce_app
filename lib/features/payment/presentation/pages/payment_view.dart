import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/common/ecommerce_text_button_container.dart';
import 'package:store/features/payment/presentation/manager/paymentMethod/payment_bloc.dart';
import 'package:store/features/payment/presentation/manager/paymentMethod/payment_state.dart';
import '../../../common/ecommerce_app_bar.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: EcommerceAppBar(
        title: "Payment Method",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.status == PaymentStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == PaymentStatus.error) {
            Center(child: Text("ERROR"));
          }
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
              itemCount: state.cards?.length ?? 0,
              itemBuilder: (context, index) {
                final card = state.cards![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Do you want to delete the card?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.read<PaymentBloc>().add(
                                      DeleteCardEvent(card.id as String ),
                                    );
                                  },
                                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      width: 341.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          Text(
                            card.cardNum,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Radio<int>(
                            value: index,
                            groupValue: selectedIndex,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                selectedIndex = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: EcommerceTextButtonContainer(
          text: "Add New Card",
          textColor: AppColors.primary,
          containerColor: Colors.white,
          containerWidth: 341.w,
          containerHeight: 54.h,
          callback: () {
            context.push(Routes.newCard);
          },
          borderColor: AppColors.primary100,
          radius: 10,
        ),
      ),
    );
  }
}
