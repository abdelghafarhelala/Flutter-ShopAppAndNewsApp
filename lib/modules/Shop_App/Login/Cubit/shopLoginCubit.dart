

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';
import 'package:test1/modules/Shop_App/Login/Cubit/shopLoginStates.dart';
import 'package:test1/network/endPoint.dart';
import 'package:test1/network/remote/dio_healper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit():super(ShopLoginIntialState());
  ShopAppModel loginModel;

  static ShopLoginCubit get(context) =>BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password
  }){
    emit(ShopLoginLoodingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      }).then((value) {
       loginModel=ShopAppModel.fromJson(value.data);
      
        emit(ShopLoginSuccessState(loginModel));
      }).catchError((error){
       
        emit(ShopLoginErrorState(error.toString()));
      });
  }

  bool ispass=true;
  IconData suffix= Icons.visibility_outlined;
  void changePasswordVisibilty(){
    ispass=!ispass;
    ispass ?suffix=Icons.visibility_outlined:suffix=Icons.visibility_off_outlined;
    emit(ShopLoginPasswordShown());
  }




}