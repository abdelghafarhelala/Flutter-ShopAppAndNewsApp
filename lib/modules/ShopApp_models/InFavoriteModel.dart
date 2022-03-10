
class InFavoriteModel{
  bool status;
  String message;
  InFavoriteModel.fromjson(Map<String,dynamic>json){
    status=json['status'];
    message=json['message'];
  }
}