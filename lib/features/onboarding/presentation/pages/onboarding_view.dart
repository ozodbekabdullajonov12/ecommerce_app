import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Define yourself in your unique way.",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 64,
              fontWeight: FontWeight.w600,
            ),
          ),
          SvgPicture.asset('ecommerce/images/onboarding.png',
            width: 300,
            height: 300,
          ),
          SizedBox(
            width: 341,
            height: 54,
            child: ElevatedButton(onPressed: (){},
              child:Text('Get Started',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
