// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data_layer/models/Login.dart';
import 'package:shop_app/data_layer/remote/dio_helper.dart';
import 'package:shop_app/data_layer/remote/end_points.dart';
import 'package:shop_app/domain_layer/bloc/shop_login_cubit/shop_login_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit get(BuildContext context) => BlocProvider.of(context);

Login? loginModel ;
  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingStates());
    DioHelper.postData(
      url: login,
      data: {'email': email, 'password': password},
    ).then((value) {
      print(value!.data);
      loginModel = Login.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  bool isVisible =false;
IconData suffix =Icons.visibility_off_outlined;
  void toggleVisibility(){
    isVisible=!isVisible;
    suffix = isVisible ?    Icons.visibility_off_outlined:Icons.visibility_outlined;
emit(ShopChangePasswordVisibilityStates());
  }

}
