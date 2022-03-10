class CategoriesModel{
  bool status;
  CategoriesDataModel data;
  CategoriesModel.fromjson(Map<dynamic,dynamic>json){
   status=json['status'];
   data=CategoriesDataModel.fromjson(json['data']);
 
   
 }
}


class CategoriesDataModel{
  int currentPage;
  List<CategoryData>data=[];
  CategoriesDataModel.fromjson(Map<dynamic,dynamic>json){
   currentPage=json['current_page'];
   json['data'].forEach((e){
     data.add(CategoryData.fromjson(e));
   });
   
 }

}



class CategoryData{
  int id;
  String name;
  String image;
 
 CategoryData.fromjson(Map<dynamic,dynamic>json){
   id=json['id'];
   name=json['name'];
   image=json['image'];
 }

}