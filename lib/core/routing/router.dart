import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/auth/presentation/pages/sign_up_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/enter_otp_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/forgot_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/reset_password_view.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:store/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:store/main.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.forgotPassword,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
        path: Routes.signUp,
        builder: (context, state) => SignUpView()),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state)=> SplashScreen(),
    ),
    GoRoute(path: Routes.forgotPassword,
    builder: (context, state)=>ForgotView()),
    GoRoute(path: Routes.enterPassword,
    builder: (context, state)=> EnterOtpView()),
    GoRoute(path: Routes.resetPassword,
    builder: (context,state)=>ResetPasswordView()),
  ],
);
