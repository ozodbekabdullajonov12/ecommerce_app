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
  final directory = await getDownloadsDirectory();
  Hive.init(directory!.path);
  Hive.registerAdapter(SearchHistoryModelAdapter());
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
