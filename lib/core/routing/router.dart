import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:store/features/auth/presentation/pages/login_view.dart';
import 'package:store/features/auth/presentation/pages/sign_up_view.dart';
import 'package:store/features/checkout/presentation/pages/checkout_view.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';
import 'package:store/features/home/presentation/pages/home_view.dart';
import 'package:store/features/home/presentation/pages/search_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/enter_otp_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/forgot_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/reset_password_view.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:store/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:store/features/product_details/presentation/pages/product_details_view.dart';
import 'package:store/features/review/presentation/pages/review_view.dart';
import 'package:store/main.dart';

import '../../features/home/presentation/pages/notifications_view.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.checkout,
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
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => BlocProvider(
            create: (context) => HomeBloc(repo: context.read()),
            child: HomeView(),
          ),
    ),
    GoRoute(path: Routes.search, builder: (context, state) => SearchView()),
    GoRoute(
      path: Routes.notifications,
      builder: (context, state) => NotificationsView(),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder: (context, state) => ForgotView(),
    ),
    GoRoute(
      path: Routes.enterPassword,
      builder: (context, state) => EnterOtpView(),
    ),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) => ResetPasswordView(),
    ),
    GoRoute(path: Routes.product_details,builder: (context, state) => ProductDetailsView(),),
    GoRoute(path: Routes.reviews,builder: (context, state) => ReviewView(),),
  ],
);
