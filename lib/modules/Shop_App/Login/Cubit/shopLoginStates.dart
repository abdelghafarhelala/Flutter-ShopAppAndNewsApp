import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';


abstract class ShopLoginStates {}
 class ShopLoginIntialState extends ShopLoginStates{}
 class ShopLoginLoodingState extends ShopLoginStates{}
 class ShopLoginSuccessState extends ShopLoginStates{
   final ShopAppModel model;

  ShopLoginSuccessState(this.model);
 }
 class ShopLoginErrorState extends ShopLoginStates{
   final String error;
   ShopLoginErrorState(this.error);
 }
 class ShopLoginPasswordShown extends ShopLoginStates{}

