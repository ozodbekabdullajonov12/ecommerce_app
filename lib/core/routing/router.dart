import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/account/presentation/pages/account_help_center_view.dart';
import 'package:store/features/account/presentation/pages/account_my_details_view.dart';
import 'package:store/features/account/presentation/pages/account_my_orders_view.dart';
import 'package:store/features/account/presentation/pages/account_notifications_view.dart';
import 'package:store/features/account/presentation/pages/account_view.dart';
import 'package:store/features/add_address/presentation/manager/add_address_bloc.dart';
import 'package:store/features/add_address/presentation/pages/add_address_view.dart';
import 'package:store/features/address/presentation/pages/address_view.dart';
import 'package:store/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:store/features/auth/presentation/pages/login_view.dart';
import 'package:store/features/auth/presentation/pages/sign_up_view.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_bloc.dart';
import 'package:store/features/forget_reset_password/presentation/pages/enter_otp_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/forgot_view.dart';
import 'package:store/features/forget_reset_password/presentation/pages/reset_password_view.dart';
import 'package:store/features/home/presentation/manager/home_bloc.dart';
import 'package:store/features/home/presentation/manager/search/search_bloc.dart';
import 'package:store/features/home/presentation/pages/home_view.dart';
import 'package:store/features/home/presentation/pages/search_view.dart';
import 'package:store/features/myCart/presentation/pages/my_cart_check_out_view.dart';
import 'package:store/features/myCart/presentation/pages/my_cart_new_card_view.dart';
import 'package:store/features/myCart/presentation/pages/my_cart_payment_method_view.dart';
import 'package:store/features/myCart/presentation/pages/my_cart_view.dart';
import 'package:store/features/myCart/presentation/pages/your_cart_view.dart';
import 'package:store/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:store/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:store/features/product_details/presentation/manager/product_details_bloc.dart';
import 'package:store/features/product_details/presentation/pages/product_details_view.dart';
import 'package:store/features/review/presentation/pages/review_view.dart';
import 'package:store/features/saved_items/presentation/pages/saved_items_view.dart';
import 'package:store/main.dart';

import '../../features/home/presentation/pages/notifications_view.dart';
import '../../features/review/presentation/manager/review/review_bloc.dart';



final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
 routes: [
    GoRoute(path: Routes.onboarding, builder: (context, state) => OnboardingView()),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) => BlocProvider(
            create: (context) => SignUpBloc(repo: context.read()),
            child: SignUpView(),
          ),
    ),
    GoRoute(path: Routes.splashScreen, builder: (context, state) => SplashScreen()),
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
            create:
                (context) => HomeBloc(
                  repo: context.read(),

                ),
            child: HomeView(),
          ),
    ),

    GoRoute(path: Routes.search,
        builder: (context, state) =>
            BlocProvider(create: (context) =>
                SearchBloc(productRepo: context.read(),
                    historyRepo: context.read()
                 ),
            child:  SearchView(),
            ),
    ),
    GoRoute(
      path: Routes.notifications,
      builder: (context, state) => NotificationsView(),),
   GoRoute(path: Routes.search,
       builder: (context, state) =>
           BlocProvider(create: (context) =>
               SearchBloc(
                 productRepo: context.read(), historyRepo: context.read(),),

           child: SearchView(),)),
    GoRoute(path: Routes.notifications, builder: (context, state) => NotificationsView()),
    ShellRoute(
      builder:
          (context, state, child) => BlocProvider(
            create: (context) => ResetPasswordBloc(repoReset: context.read()),
            child: child,
          ),
      routes: [
        GoRoute(path: Routes.forgotPassword, builder: (context, state) => ForgotView()),
        GoRoute(path: Routes.enterCode, builder: (context, state) => EnterOtpView()),
        GoRoute(path: Routes.resetPassword, builder: (context, state) => ResetPasswordView()),
      ],
    ),
    GoRoute(path: Routes.savedItems, builder: (context, state) => SavedItemsView()),
    GoRoute(path: Routes.myCart, builder: (context, state) => MyCartView()),
    GoRoute(path: Routes.yourCart, builder: (context, state) => YourCartView()),
    GoRoute(path: Routes.checkout, builder: (context, state) => MyCartCheckOut()),
    GoRoute(path: Routes.paymentMethod, builder: (context, state) => MyCartPaymentMethodView()),
    GoRoute(path: Routes.newCard, builder: (context, state) => MyCartNewCardView()),
    GoRoute(path: Routes.account, builder: (context, state) => AccountView()),
    GoRoute(path: Routes.helpCenter, builder: (context, state) => AccountHelpCenterView()),
    GoRoute(path: Routes.myOrders, builder: (context, state) => AccountMyOrdersView()),
    GoRoute(path: Routes.enterCode, builder: (context, state) => EnterOtpView()),
    GoRoute(path: Routes.resetPassword, builder: (context, state) => ResetPasswordView()),

    GoRoute(path: Routes.productDetails, builder: (context, state) => ProductDetailsView()),

    GoRoute(
      path: Routes.productDetails,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => ProductDetailsBloc(
                  repo: context.read(),
                  productId: int.parse(state.pathParameters["productId"]!),
                ),
            child: ProductDetailsView(),
          ),
    ),
    GoRoute(
      path: Routes.review(1),
      builder:
          (context, state) => BlocProvider(
            create: (context) => ReviewBloc(repo: context.read()),
            child: ReviewView(),
          ),
    ),
    GoRoute(path: Routes.address, builder: (context, state) => AddressView()),
    // GoRoute(
    //   path: Routes.addAddress,
    //   builder:
    //       (context, state) =>
    //           BlocProvider(create: (context) => AddAddressBloc(), child: AddAddressView()),
    // ),
    GoRoute(path: Routes.myDetails,
    builder: (context, state)=>AccountMyDetailsView()),
    GoRoute(path: Routes.myNotifications,
    builder: (context,state)=>AccountNotificationsView()),
    GoRoute(
      path: Routes.addAddress,
      builder:
          (context, state) =>
              BlocProvider(create: (context) => AddAddressBloc(), child: AddAddressView()),
    ),
  ],
);
