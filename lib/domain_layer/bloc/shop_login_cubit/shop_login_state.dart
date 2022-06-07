


import 'package:shop_app/data_layer/models/Login.dart';

abstract class ShopLoginState {}

class ShopLoginInitialStates extends ShopLoginState {}
class ShopLoginLoadingStates extends ShopLoginState {
}
class ShopLoginSuccessState extends ShopLoginState {
  final Login login;
  ShopLoginSuccessState(this.login);
}
class ShopLoginErrorState extends ShopLoginState {
  late final String error;
  ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityStates extends ShopLoginState {
}


