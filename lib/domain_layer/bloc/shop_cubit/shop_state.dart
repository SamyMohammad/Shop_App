part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}
class ShopChangeBottomNavState extends ShopState {}
class ShopLoadingHomeDataState extends ShopState{}
class ShopSuccessHomeDataState extends ShopState{}
class ShopErrorHomeDataState extends ShopState{}
class ShopSuccessCategoriesState extends ShopState{}
class ShopErrorCategoriesState extends ShopState{}
class ShopSuccessFavouritesState extends ShopState{

  final FavouritesModel model;

  ShopSuccessFavouritesState(this.model);
}
class ShopErrorFavouritesState extends ShopState{}
class ShopChangeFavouritesState extends ShopState{}

class ShopErrorGetFavouritesState extends ShopState{}
class ShopSuccessGetFavouritesState extends ShopState{}
class ShopLoadingGetFavouritesState extends ShopState{}
class ShopErrorUserDataState extends ShopState{}
class ShopSuccessUserDataState extends ShopState{
  final Login? loginModel;
  ShopSuccessUserDataState(this.loginModel);
}
class ShopLoadingUserDataState extends ShopState{}
