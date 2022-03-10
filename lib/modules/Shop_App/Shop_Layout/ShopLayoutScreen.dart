import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/Shop_App/Shop_Search/Shop_SearchScreen.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/shared/components/components.dart';

class ShopLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.black, 
            child: Text("Sala",
            style: TextStyle(
              color: Colors.black
            ),)),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, ShopSearchScreen());
                },
                   icon: Icon(Icons.search,color: Colors.black, ),
              ),
            
            ],
        ),
       
        body:cubit.shopScreens[cubit.currentIndex] ,
        bottomNavigationBar:BottomNavigationBar(
          items: cubit.buttomItems,
          onTap: (index) {
            cubit.changeShopNav(index);
          },
          currentIndex: cubit.currentIndex,
          ),
        
      );
      },
      
    );
  }
}