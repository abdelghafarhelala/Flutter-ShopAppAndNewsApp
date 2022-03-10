import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsStates.dart';
import 'package:test1/modules/News_App/business_screen/business.dart';
import 'package:test1/modules/News_App/scince_scrren/scince.dart';
import 'package:test1/modules/News_App/settings_screen/settings.dart';
import 'package:test1/modules/News_App/sport_screen/sport.dart';

import 'package:test1/network/remote/dio_healper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> buttomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Busniss",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];
  List<Widget> screens = [
    Business(),
    Sports(),
    Scince(),
    Settings(),
  ];

  void bottomNavBar(int index) {
    currentIndex = index;
    emit(ButtomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> scince = [];

  void getBusinessCubit() {
    emit(NewsBusinessLoodingstate());
    DioHelper.getData(
       url: 'v2/top-headlines',
      query: {
        'q': 'Apple',
        'from': '2022-02-09',
        'sortBy': 'popularity',

        // 'state': 'TX',
        'apikey': 'f60d1f6b1ec84ae59fba3b0e8df8331b'
      },
    ).then((value) {
      print(value.data.toString());
      business = value.data['articles'];
      emit(NewsGetBusinessScucessstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorstate(error.toString()));
    });
  }

  void getSportsCubit() {
    emit(NewsSportsLoodingstate());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        // 'state': 'TX',
        'apikey': 'f60d1f6b1ec84ae59fba3b0e8df8331b'
      },
    ).then((value) {
      print(value.data.toString());
      sports = value.data['articles'];
      emit(NewsGetSportsScucessstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorstate(error.toString()));
    });
  }

  void getScinceCubit() {
    emit(NewsScinceLoodingstate());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'sources': 'bbc-news',
        // 'state': 'TX',
        'apikey': 'f60d1f6b1ec84ae59fba3b0e8df8331b'
      },
    ).then((value) {
      print(value.data.toString());
      scince = value.data['articles'];
      emit(NewsGetScinceScucessstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScinceErrorstate(error.toString()));
    });
  }

 List<dynamic> search = [];
void getSearchCubit(String value) {
    emit(NewsSearchLoodingstate());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        // 'state': 'TX',
        'apikey': 'f60d1f6b1ec84ae59fba3b0e8df8331b'
      },
    ).then((value) {
      print(value.data.toString());
      search = value.data['articles'];
      emit(NewsGetSearchScucessstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorstate(error.toString()));
    });
  }



}
