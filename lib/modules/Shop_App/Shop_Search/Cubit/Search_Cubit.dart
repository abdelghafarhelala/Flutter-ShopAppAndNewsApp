

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/SearchModel.dart';
import 'package:test1/modules/Shop_App/Shop_Search/Cubit/Search_states.dart';
import 'package:test1/network/endPoint.dart';
import 'package:test1/network/remote/dio_healper.dart';
import 'package:test1/shared/const/const.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInatialState());
  static SearchCubit git(context)=>BlocProvider.of(context);


  SearchModel model;
  void search(String text){
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        'text':text
      },
      token: token
      ).then((value) {
        model=SearchModel.fromJson(value.data);
        print(model.data.data.length);

    emit(SearchSuccessState());

      }).catchError((error){
    emit(SearchErrorState(error.toString()));

      });

  }



}