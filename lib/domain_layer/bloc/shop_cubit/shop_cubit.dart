
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data_layer/models/CategoriesModel.dart';
import 'package:shop_app/data_layer/models/FavouritesModel.dart';
import 'package:shop_app/data_layer/models/GetFavouritesModel.dart';
import 'package:shop_app/data_layer/models/Home.dart';
import 'package:shop_app/data_layer/remote/dio_helper.dart';
import 'package:shop_app/presentation_layer/screens/categories_screen.dart';
import 'package:shop_app/presentation_layer/screens/favourites_screen.dart';

import '../../../constatnts/constatnts.dart';
import '../../../data_layer/models/Login.dart';
import '../../../data_layer/remote/end_points.dart';
import '../../../presentation_layer/screens/home_screen.dart';
import '../../../presentation_layer/screens/settings_screen.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screenNavigation = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
     SettingsScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<num?, bool?> favourites = {};
   FavouritesModel? favouritesModel;
  CategoriesModel? categoriesModel;
  GetFavouritesModel? getFavouritesModel;
  Login? loginModel;
  HomeModel? homeModel;

  dynamic getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(url: home, token: token).then((value) {
      print('in get data ');

      homeModel = HomeModel.fromJson(value.data);
      print(homeModel);
      for (var element in homeModel!.data!.products!) {
        favourites.addAll({element.id: element.inFavorites});
      }
      // printFullText(homeModel.data!.banners![2].image??'');
      print(favourites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorHomeDataState());
    });
  }



  dynamic getCategoriesData() {
    DioHelper.getData(url: getCategories).then((value) {
      print('in get data ');

      categoriesModel = CategoriesModel.fromJson(value.data);
      print(homeModel);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoriesState());
    });
  }

  void changeFavourites(num? productId) {
    favourites[productId] =! favourites[productId]!;
    emit(ShopChangeFavouritesState());
    DioHelper.postData(
            url: FAVOURITES, data: {'product_id': productId},token: token )
        .then((value) {
      favouritesModel = FavouritesModel.fromJson(value!.data);

      if (!favouritesModel!.status!) {
        favourites[productId] =! favourites[productId]!;
      }else{
        getFavouritesData();
      }
      emit(ShopSuccessFavouritesState(favouritesModel!));
    }).catchError((error) {
      favourites[productId] =! favourites[productId]!;
      emit(ShopErrorFavouritesState());
    });
  }





  dynamic getFavouritesData() {
    emit(ShopLoadingGetFavouritesState());
    DioHelper.getData(url: FAVOURITES,token: token).then((value) {
      print('in get data ');

      getFavouritesModel = GetFavouritesModel.fromJson(value.data);
      print(getFavouritesModel);

      emit(ShopSuccessGetFavouritesState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorGetFavouritesState());
    });
  }



  dynamic getProfileData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(url: PROFILE,token: token).then((value) {
      print('in get data ');

      loginModel = Login.fromJson(value.data);
      print(loginModel!.data!.name);

      emit(ShopSuccessUserDataState(loginModel));
    }).catchError((error) {
      print(error);
      emit(ShopErrorUserDataState());
    });
  }
}
