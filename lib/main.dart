import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store/core/dependencies.dart';
import 'package:store/core/routing/router.dart';
import 'package:store/data/models/my_cart/my_cart_adapter.dart';
import 'package:store/data/models/my_cart/my_cart_model.dart';
import 'package:store/data/models/search_history_model.dart';

final navigatorKey=GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cashDir = await getApplicationDocumentsDirectory();
  Hive.init(cashDir.path);
  Hive.registerAdapter(MyCartModelAdapter());
  await Hive.openBox<MyCartModel>("myCart");
  await Firebase.initializeApp();
  final directory = await getDownloadsDirectory();
  Hive.init(directory!.path);
  Hive.registerAdapter(SearchHistoryModelAdapter());
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    provisional: false,
    criticalAlert: false,
    carPlay: false,
    badge: false,
    sound: true,
  );
  runApp(const Ecommerce());
}




class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiBlocProvider(
        providers: providers,
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
// Future hiveInitFunc() async {
//   final directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//   Hive.registerAdapter(SearchHistoryModelAdapter());
//   Hive.registerAdapter(CategoryModelAdapter());
//   Hive.registerAdapter(ProductDetailImagesModelAdapter());
//   Hive.registerAdapter(ProductDetailsModelAdapter());
//   Hive.registerAdapter(ProductDetailsSizeModelAdapter());
//   Hive.registerAdapter(ProductModelAdapter());
//   Hive.registerAdapter(SizeModelAdapter());
//   await Hive.openBox<ProductModel>(ProductRepositoryLocal.productsBoxName);
//   await Hive.openBox<ProductModel>(ProductRepositoryLocal.savedProductBoxName);
//   await Hive.openBox<SizeModel>(ProductRepositoryLocal.sizesBoxName);
//   await Hive.openBox<CategoryModel>(ProductRepositoryLocal.categoriesBoxName);
//   await Hive.openBox<ProductModel>(ProductRepositoryLocal.searchedProductsBoxName);
//   await Hive.openBox<ProductDetailsModel>(ProductRepositoryLocal.productDetailBoxName);
// }