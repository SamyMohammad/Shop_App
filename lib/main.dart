import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constatnts/route_generator.dart';
import 'package:shop_app/constatnts/theme_manager.dart';
import 'package:shop_app/data_layer/local/cache_helper.dart';
import 'package:shop_app/data_layer/models/Home.dart';
import 'package:shop_app/data_layer/remote/dio_helper.dart';
import 'package:shop_app/domain_layer/bloc/shop_cubit/shop_cubit.dart';
import 'package:shop_app/presentation_layer/screens/main_screen.dart';
import 'package:shop_app/presentation_layer/screens/login_screen.dart';
import 'package:shop_app/presentation_layer/screens/on_boarding/on_boarding_screen.dart';

import 'constatnts/constatnts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
   token = CacheHelper.getString(key: 'token');
  bool? onBoarding = CacheHelper.getBool(key: 'onBoarding');
  print(onBoarding);
  print(token);
  String chooseTheInitialRoute() {
    if (onBoarding != false) {
      if (token != '') {
        return MainScreen.routeName;
      } else {
        return LoginScreen.routeName;
      }
    } else {
      return '/';
    }
  }

  runApp(MyApp(
    initialRoute: chooseTheInitialRoute(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  final String initialRoute;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavouritesData()..getProfileData())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeManager.lightTheme,
          initialRoute: initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
