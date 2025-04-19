import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';

class FruitHub extends StatelessWidget {
   FruitHub({super.key});
final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SplashView,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

