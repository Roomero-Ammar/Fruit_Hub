import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';
class AppRouter{
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
switch (settings.name) {
    case Routes.SplashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case Routes.OnBoardingView:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case '/signup':
      return MaterialPageRoute(builder: (context) => const Placeholder());
default : 
      return MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(),));
}
  
}


}

