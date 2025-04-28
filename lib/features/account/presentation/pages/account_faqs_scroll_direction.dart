import 'package:flutter/material.dart';

class AccountFaqsScrollDirection extends StatefulWidget {
  const AccountFaqsScrollDirection({super.key});

  @override
  State<AccountFaqsScrollDirection> createState() => _AccountFaqsScrollDirectionState();
}

class _AccountFaqsScrollDirectionState extends State<AccountFaqsScrollDirection> {
  int? isSelected;
  List<String> categories = [
    'General',
    "Account",
    "Service",
    "Payment"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
        children: [
          // List.generate(categories.length, (index){
          //   return
          // })
        ]));
  }
}
