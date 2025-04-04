import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';

final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: Routes.onboarding,
        builder: (context, state)=> OnboardingView(),),
    ]);
