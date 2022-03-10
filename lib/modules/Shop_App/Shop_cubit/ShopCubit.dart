import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/Catigories_Model.dart';
import 'package:test1/modules/ShopApp_models/ChangeFavoritesModel.dart';
import 'package:test1/modules/ShopApp_models/InFavoriteModel.dart';
import 'package:test1/modules/ShopApp_models/HomeModel.dart';
import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';
import 'package:test1/modules/Shop_App/Shop_Catigories/CatigoriesScreen.dart';
import 'package:test1/modules/Shop_App/Shop_Favorites/FavoritesScreen.dart';
import 'package:test1/modules/Shop_App/Shop_Product/productScreen.dart';
import 'package:test1/modules/Shop_App/Shop_Settings/SettingsScreen.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/network/endPoint.dart';
import 'package:test1/network/remote/dio_healper.dart';
import 'package:test1/shared/const/const.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopIntialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  HomeModel homeModel;
  CategoriesModel category;

  List<BottomNavigationBarItem> buttomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Catigories'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Faviortes'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> shopScreens = [
    ProductsScreen(),
    CatigoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;
  void changeShopNav(index) {
    currentIndex = index;
    emit(ShopChageNavButtomState());
  }

  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error.toString()));
      print(error.toString());
    });
  }

  void getCategoryData() {
    DioHelper.getData(url: GET_CATEGORIED, token: token).then((value) {
      category = CategoriesModel.fromjson(value.data);
      emit(ShopSuccessCategoryDataState());
    }).catchError((error) {
      emit(ShopErrorCategoryDataState(error.toString()));
      print(error.toString());
    });
  }

  InFavoriteModel infavoriteModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId];
    emit(ShopChangeFavoriteState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      infavoriteModel = InFavoriteModel.fromjson(value.data);
      print(value.data);
      if (!infavoriteModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavoriteData();
      }
      emit(ShopChangeFavoriteSuccessState(infavoriteModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];
      emit(ShopChangeFavoriteErrorState(error.toString()));
    });
  }

  ChangeFavoritModel changeFavoriteModel;
  void getFavoriteData() {
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      changeFavoriteModel = ChangeFavoritModel.fromJson(value.data);
      print(value.data);
      emit(ShopSuccessFavoriteDataState());
    }).catchError((error) {
      emit(ShopErrorFavoriteDataState(error.toString()));
      print(error.toString());
    });
  }

    ShopAppModel userModel;
  void getUserData(){
     emit(ShopLoadingProfileDataState());
    DioHelper.getData(url: PROFILE,token: token)
    .then((value){
        userModel=ShopAppModel.fromJson(value.data);
        print(value.data);
      emit(ShopSuccessProfileDataState(userModel));
    
    })
    .catchError((error){
      emit(ShopErrorProfileDataState(error.toString()));
      print(error.toString());
    });

}


ShopAppModel updateUserModel;
  void updaterUserData({
    @required String name,
    @required String email,
    @required String phone,

  }){
     emit(ShopLoadingUpdateProfileDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name':name,
        'email':email,
        'phone':phone,
      }

      ).then((value){
        userModel=ShopAppModel.fromJson(value.data);
        print(value.data);
      emit(ShopSuccessUpdateProfileDataState(updateUserModel));
    
    })
    .catchError((error){
      emit(ShopErrorUpdateProfileDataState(error.toString()));
      print(error.toString());
    });

}

}
