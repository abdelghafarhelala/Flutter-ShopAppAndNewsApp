import 'package:flutter/cupertino.dart';
import 'package:test1/modules/Shop_App/Login/ShopLoginScreen.dart';
import 'package:test1/network/local/cach_helper.dart';
import 'package:test1/shared/components/components.dart';

String token = '';
void logOut(context) {
  ChacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinsh(context, ShopLoginScreen());
    }
  });
}
