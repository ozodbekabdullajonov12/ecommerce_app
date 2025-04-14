import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store/core/dependencies.dart';
import 'package:store/core/routing/router.dart';



final navigatorKey=GlobalKey<NavigatorState>();
void main() {

  runApp(Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return MultiBlocProvider(
        providers: providers,
       child: MaterialApp.router(
         routerConfig: router,
         debugShowCheckedModeBanner: false,
       ),
    );
  }
}
