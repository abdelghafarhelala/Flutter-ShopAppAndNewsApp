import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsCubit.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsStates.dart';
import 'package:test1/modules/News_App/search_screen/search.dart';
import 'package:test1/network/remote/dio_healper.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/to_do_cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Title(color: Colors.red, child: Text("News")),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, search());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.git(context).ChangeAppThem();
                },
                icon: Icon(Icons.brightness_1),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: cubit.buttomItems,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.bottomNavBar(value);
              },
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              DioHelper.getData(
                url: 'v2/top-headlines',
                query: {
                  'country': 'us',
                  // 'state': 'TX',
                  'apikey': 'f60d1f6b1ec84ae59fba3b0e8df8331b'
                },
              ).then((value) {
                print(value.data.toString());
              }).catchError((error) {
                print(error.toString());
              });
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
