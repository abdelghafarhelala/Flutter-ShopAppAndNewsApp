import 'package:test1/modules/ShopApp_models/InFavoriteModel.dart';
import 'package:test1/modules/ShopApp_models/shopApp_Login_model.dart';

abstract class ShopStates{}
class ShopIntialState extends ShopStates{}
class ShopChageNavButtomState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{
  final String error;
  ShopErrorHomeDataState(this.error);
}
class ShopSuccessCategoryDataState extends ShopStates{}
class ShopErrorCategoryDataState extends ShopStates{
  final String error;
  ShopErrorCategoryDataState(this.error);
}
class ShopChangeFavoriteSuccessState extends ShopStates{
  final InFavoriteModel model;

  ShopChangeFavoriteSuccessState(this.model);
}
class ShopChangeFavoriteState extends ShopStates{}
class ShopChangeFavoriteErrorState extends ShopStates{
  final String error;
  ShopChangeFavoriteErrorState(this.error);
}

class ShopLoadingFavoriteDataState extends ShopStates{}
class ShopSuccessFavoriteDataState extends ShopStates{}
class ShopErrorFavoriteDataState extends ShopStates{
  final String error;
  ShopErrorFavoriteDataState(this.error);
}
class ShopLoadingProfileDataState extends ShopStates{}
class ShopSuccessProfileDataState extends ShopStates{
  final ShopAppModel model;

  ShopSuccessProfileDataState(this.model);
}
class ShopErrorProfileDataState extends ShopStates{
  final String error;
  ShopErrorProfileDataState(this.error);
}
class ShopLoadingUpdateProfileDataState extends ShopStates{}
class ShopSuccessUpdateProfileDataState extends ShopStates{
  final ShopAppModel model;

  ShopSuccessUpdateProfileDataState(this.model);
}
class ShopErrorUpdateProfileDataState extends ShopStates{
  final String error;
  ShopErrorUpdateProfileDataState(this.error);
}
