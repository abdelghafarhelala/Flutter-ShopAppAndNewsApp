

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/Catigories_Model.dart';
import 'package:test1/modules/ShopApp_models/HomeModel.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {
        if(state is ShopChangeFavoriteSuccessState)
          if(!state.model.status){
            showToast(text: state.model.message, state: ToastStates.error);
          }
      },
      builder: (context, state) {
        return Center(
        child: ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null&&ShopCubit.get(context).category!=null,
          builder:(context) =>  buildProduct(ShopCubit.get(context).homeModel,ShopCubit.get(context).category,context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
          
        ),
      );
      },
      
    );
  }

  Widget buildProduct(HomeModel model,CategoriesModel category,context)=>SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: model.data.banners.map((e) => Image(image:
           NetworkImage('${e.image}'),
            fit: BoxFit.cover,
            width: double.infinity,
           ),
          ).toList(),
           options: CarouselOptions(
             height: 250,
             initialPage: 0,
             viewportFraction: 1,
             autoPlay: true,
             autoPlayAnimationDuration: Duration(seconds: 1),
             autoPlayInterval: Duration(seconds: 3),
             autoPlayCurve: Curves.fastOutSlowIn,
             scrollDirection: Axis.horizontal,
             reverse: false,
           ),),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildCategoryItem(category.data.data[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 10,),
                  itemCount: category.data.data.length
                ),
              ),
              SizedBox(height: 10,),
              Text('New Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),  
        Container(
          color: Colors.grey[300],
          child: GridView.count(crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 1/1.62,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(model.data.products.length, (index) => buildProductItem((model.data.products[index]),context)
            
          ,
          ),
          ),
        )],
),
);

Widget buildCategoryItem(CategoryData categoryData)=>Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(image: 
            NetworkImage(categoryData.image),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            ),
            Container(
              width: 100,
              color: Colors.black.withOpacity(.8),
              child: Text(categoryData.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign:TextAlign.center,
              ),
            ),
          ],
        );

Widget buildProductItem(ProductModel model,context)=>Container(
    color: Colors.white,
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(image:
            NetworkImage(model.image),
              height: 200.0,
              width: double.infinity,
          ),
          if(model.discount!=0)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.red,
            child: Text("DISCOUNT",
              style: TextStyle(color: Colors.white,fontSize: 10),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.name,
              style: TextStyle(
                fontSize: 14,
                height: 1.3
              ),
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ),
            Row(  
              children: [  
                Text('${model.price.round()}',
                  style: TextStyle(  
                    fontSize: 12, 
                    color: default_Color,  
                  ), 
                ),  
                SizedBox(width: 5,),  
                if(model.discount!=0)
                Text('${model.oldPrice.round()}',                  
                  style: TextStyle(  
                    fontSize: 11, 
                    color: Colors.grey, 
                    decoration: TextDecoration.lineThrough,  
                  ), 
                ), 
                Spacer(),
                IconButton(
                  onPressed: (){
                    print(model.id);
                    ShopCubit.get(context).changeFavorites(model.id);
                    
                    },
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: ShopCubit.get(context).favorites[model.id] ?Colors.red[400] :Colors.grey[300],
                    child: Icon(Icons.favorite_border,color: Colors.white,)))
              ], 
            ),
          ], 
          
        ),  
      ) 
    ], 
    ),
    );
  
}