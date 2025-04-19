import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';
class AppRouter{
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
switch (settings.name) {
    case Routes.SplashView:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case '/login':
      return MaterialPageRoute(builder: (context) => const Placeholder());
    case '/signup':
      return MaterialPageRoute(builder: (context) => const Placeholder());
default : 
      return MaterialPageRoute(builder: (context) => Scaffold(appBar: AppBar(),));
}
  
}


}

