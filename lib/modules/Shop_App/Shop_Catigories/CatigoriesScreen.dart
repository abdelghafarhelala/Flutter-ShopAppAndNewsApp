import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/Catigories_Model.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/shared/components/components.dart';

class CatigoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>buildCatigory(ShopCubit.get(context).category.data.data[index] ) ,
          separatorBuilder:(context, index) =>  lineSpreate(),
          itemCount: ShopCubit.get(context).category.data.data.length
        );
      },
      
    );
  }



  Widget buildCatigory(CategoryData categoryData)=>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        
        children: [
          Image(image: NetworkImage(categoryData.image),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20,),
          Text(categoryData.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20

          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)

        ],
      ),
    );
}