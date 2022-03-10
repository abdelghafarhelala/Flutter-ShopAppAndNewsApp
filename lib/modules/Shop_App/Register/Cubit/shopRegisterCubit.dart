

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';
import 'package:test1/modules/Shop_App/Register/Cubit/shopRegisterStates.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/network/endPoint.dart';
import 'package:test1/network/remote/dio_healper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterIntialState());
  ShopAppModel model; 

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(context,{@required String name,@required String email, @required String password,@required String phone,}) {
    ShopCubit.get(context).getUserData();
    emit(ShopRegisterLoodingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
       'name': name,
       'email': email,
       'password': password,
       'phone': phone,
    }).then((value) {
      
      model = ShopAppModel.fromJson(value.data);

      emit(ShopRegisterSuccessState(model));
    }).catchError((error) {
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  bool ispass = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibilty() {
    ispass = !ispass;
    ispass ? suffix = Icons.visibility_outlined : suffix = Icons.visibility_off_outlined;
    emit(ShopRegisterPasswordShown());
  }
}
