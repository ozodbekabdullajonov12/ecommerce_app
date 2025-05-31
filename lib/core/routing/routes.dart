class Routes {
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const splashScreen = '/splash-screen';
  static const forgotPassword = '/forgot';
  static const resetPassword = '/reset';
  static const enterCode = '/enter';
  static const resetPasswordBuilder = '/reset-builder';
  static const home = '/';
  static const search = '/search';
  static const notifications = '/notifications';
  static const savedItems = "/saved-items";
  static const myCart = "/my-cart";
  static const yourCart = "/your-cart";
  static const checkout = '/checkout';
  static const paymentMethod = '/payment-method';
  static const newCard = '/new-card';
  static const account = '/account';
  static const helpCenter = '/help-center';
  static const myOrders = '/my-orders';
  static const productDetails = '/product-details/:productId';
  static const address = '/address';
  static const addAddress = '/addAddress';
  static String review(int id) => "/review/$id";
  static const myDetails = "/my-details";

  static const myNotifications = '/my-notifications';
  static String productDetailsBuilder(int id) => '/product-details/$id';
  static const customerService = '/customer-service';
}
