import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/features/payment/presentation/pages/new_card_view_bottom_navigationbar.dart';
import '../../../../core/routing/routes.dart';
import '../../../../data/models/new_card_model.dart';
import '../../../common/ecommerce_app_bar.dart';
import '../../../common/ecommerce_text_button_container.dart';
import '../manager/newCard/newcard_bloc.dart';
import '../manager/newCard/newcard_event.dart';
import '../manager/newCard/newcard_state.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final _formKey = GlobalKey<FormState>();
  final cardNumController = TextEditingController();
  final expiryDateController = TextEditingController();
  final securityCodeController = TextEditingController();

  void _submitCard() {
    if (_formKey.currentState!.validate()) {
      final newCard = NewCardModel(
        cardNumber: cardNumController.text.trim(),
        expiryDate: convertExpiryToDateTime(expiryDateController.text.trim()),
        securityCode: securityCodeController.text.trim(),
      );

      context.read<NewCardBloc>().add(SubmitNewCardEvent(newCard));
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            width: 341.w,
            height: 270.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/validation_success.svg",
                  width: 59.w,
                  height: 59.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Card Added",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Your new card has been added.",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                EcommerceTextButtonContainer(
                  text: "Thanks",
                  textColor: Colors.white,
                  containerColor: AppColors.primary,
                  containerWidth: 293.w,
                  containerHeight: 54.h,
                  callback: () => context.go(Routes.paymentMethod),
                  borderColor: AppColors.primary100,
                  radius: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "New Card",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: BlocListener<NewCardBloc, NewCardState>(
        listener: (context, state) {
          if (state is NewCardSuccess) {
            _showSuccessDialog(context);
          } else if (state is NewCardFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Divider(color: AppColors.primary100),
                SizedBox(height: 10),
                Text(
                  "Add Debit or Credit Card",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Card number",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: cardNumController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Karta raqamini kiriting';
                    } else if (value.length < 16) {
                      return 'Karta raqam to‘liq emas';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your card number",
                    hintStyle: TextStyle(
                      color: AppColors.primary100,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary100, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expiry Date",
                            style: TextStyle(
                              color: AppColors.primary.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: expiryDateController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              ExpiryDateTextFormatter(),
                            ],
                            validator: (val) =>
                            val == null || val.isEmpty ? 'Muddatni kiriting' : null,
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary100, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primary.withValues(alpha: 0.1), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Security Code",
                            style: TextStyle(
                              color: AppColors.primary.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          TextFormField(
                            controller: securityCodeController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            validator: (val) =>
                            val == null || val.isEmpty ? 'CVC kiriting' : null,
                            decoration: InputDecoration(
                              hintText: "CVC",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary100, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primary.withValues(alpha: 0.1),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<NewCardBloc, NewCardState>(
        builder: (context, state) {
          return NewCardViewBottomNavigationbar(
            onSubmit: _submitCard,
            isLoading: state is NewCardSubmitting,
          );
        },
      ),
    );
  }
}

class ExpiryDateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll('/', '');
    if (text.length > 4) text = text.substring(0, 4);
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) buffer.write('/');
    }
    final String formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
