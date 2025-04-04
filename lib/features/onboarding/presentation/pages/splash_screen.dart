import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset("assets/images/splash.png",
        width: double.infinity,
      fit: BoxFit.cover,
      ),
    );
  }
}
