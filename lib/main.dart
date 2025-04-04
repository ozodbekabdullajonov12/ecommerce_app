import 'package:flutter/material.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';

void main() {
  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingView(),
    );
  }
}
