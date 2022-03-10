import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsCubit.dart';
import 'package:test1/modules/Shop_App/Login/ShopLoginScreen.dart';
import 'package:test1/modules/Shop_App/Shop_Layout/ShopLayoutScreen.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/onBording/onBordingScreen.dart';
import 'package:test1/network/local/cach_helper.dart';
import 'package:test1/network/remote/dio_healper.dart';
import 'package:test1/shared/bloc_observer/blocObserver.dart';
import 'package:test1/shared/const/const.dart';
import 'package:test1/shared/styles/thems.dart';
import 'package:test1/shared/to_do_cubit/cubit.dart';
import 'package:test1/shared/to_do_cubit/states.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
   await ChacheHelper.init();
   bool isDark=ChacheHelper.getData(key: 'isDark');
    token= ChacheHelper.getData(key: 'token');
   bool onboarding= ChacheHelper.getData(key: 'onBoarding');
  Widget widget;
    if(  onboarding != null){
      if(token !=null)
        widget=ShopLayoutScreen();
      else
        widget=ShopLoginScreen();
    }
    else
    widget=OnBordingScreen();

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(isDark:isDark,startWidget: widget,)
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp({this.isDark,this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>  NewsCubit()
        ..getBusinessCubit()
        ..getSportsCubit()
        ..getScinceCubit(),),
        BlocProvider( create: (BuildContext context )=>AppCubit()..ChangeAppThem(fromCache: isDark),),
         BlocProvider( create: (BuildContext context )=>ShopCubit()..getHomeData()..getCategoryData()..getFavoriteData()..getUserData()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)  {
          return new MaterialApp(
            title: 'ShopAppAndToDoApp',
          debugShowCheckedModeBanner: false,
          home: startWidget,
          theme: lightThem,
          themeMode: AppCubit.git(context).isDark?ThemeMode.dark :ThemeMode.light,
          darkTheme: darkThem,
        );
        },
      ),
    );
  }
}
