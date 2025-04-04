import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.white,surfaceTintColor: Colors.transparent,),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                height: 0.8,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                fontSize: 64,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 64,
            child: IgnorePointer(
              child: Image.asset("assets/images/onboarding.png",
                width: 358,
                height: 697,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 107,
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
            child: GestureDetector(
                onTap: (){},
                child:  SizedBox(
                  width: 341,
                  height: 54,
                  child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black
                    ),
                    child:Text('Get Started',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                )
            )
        ),
      ),
    );
  }
}