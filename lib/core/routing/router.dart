import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:store/features/auth/presentation/pages/login_view.dart';
import 'package:store/features/auth/presentation/pages/sign_up_view.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:store/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:store/main.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) => BlocProvider(
            create: (context) => SignUpBloc(repo: context.read()),
            child: SignUpView(),
          ),
    ),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder:
          (context, state) => BlocProvider(
        create: (context) => LoginBloc(repo: context.read()),
        child: LoginView(),
      ),
    ),
  ],
);
