import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';



abstract class ShopRegisterStates {}
 class ShopRegisterIntialState extends ShopRegisterStates{}
 class ShopRegisterLoodingState extends ShopRegisterStates{}
 class ShopRegisterSuccessState extends ShopRegisterStates{
   final ShopAppModel model;

  ShopRegisterSuccessState(this.model);
 }
 class ShopRegisterErrorState extends ShopRegisterStates{
   final String error;
   ShopRegisterErrorState(this.error);
 }
 class ShopRegisterPasswordShown extends ShopRegisterStates{}

