import 'package:flutter/material.dart';
import 'package:shop_app/presentation_layer/screens/main_screen.dart';
import 'package:shop_app/presentation_layer/screens/login_screen.dart';
import 'package:shop_app/presentation_layer/screens/on_boarding/on_boarding_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute (RouteSettings routeSettings){
    final args =routeSettings.arguments;
switch(routeSettings.name) {

  case '/':
    return MaterialPageRoute(builder: (context)=>const OnboardingScreen());
  case LoginScreen.routeName:
    return MaterialPageRoute(builder: (context)=>const LoginScreen());
  case MainScreen.routeName:
    return MaterialPageRoute(builder: (context)=>const MainScreen());
}

return null;
  }




}