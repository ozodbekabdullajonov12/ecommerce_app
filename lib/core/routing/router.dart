import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:store/features/onboarding/presentation/pages/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.onboarding,
    routes: [
      GoRoute(path: Routes.onboarding,
        builder: (context, state)=>
            OnboardingView(),),
      GoRoute(path: Routes.splashScreen,
      builder: (context, state)=>
      SplashScreen(),
      ),
    ]
);
