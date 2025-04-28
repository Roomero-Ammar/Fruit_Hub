import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/Routing/app_router.dart';

import 'core/Routing/routes.dart';

class FruitHub extends StatelessWidget {
   FruitHub({super.key});
final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812),
        minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Cairo',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SplashView,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

