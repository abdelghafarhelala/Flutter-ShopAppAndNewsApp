import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/modules/ToDo_App/archive_screen/archive.dart';
import 'package:test1/modules/ToDo_App/done_screen/done.dart';
import 'package:test1/modules/ToDo_App/taskes_screen/taskes.dart';

import 'package:test1/network/local/cach_helper.dart';
import 'package:test1/shared/to_do_cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntialAppState());

  static AppCubit git(context) => BlocProvider.of(context);

  int current = 0;
  List<Widget> screens = [
    Taskes(),
    Done(),
    Archive(),
  ];
  List<String> titles = [
    'New Task',
    'Done',
    'Archive',
  ];

  void ChangeNav(int index) {
    current = index;
    emit(ChangeNavEdit());
  }

  Database database;
  List<Map> tasks = [];
  void createdatabase() {
    openDatabase('testt.db', version: 1, onCreate: (database, version) {
      print("database created");
      database
          .execute(
              'CREATE TABLE task(id INTEGER PRIMARY KEY,title TEXT,time TEXT)')
          .then((value) {
        print("table Created");
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      print("DataBase Opened");
      getData(database);
    }).then((value) {
      database = value;
      emit(AppCreateDataBase());
    });
  }

  void getData(database) async {
    database.rawQuery('select * from task').then(
      (value) {
        tasks = value;
        print(tasks);
        emit(AppGetDataBase());
      },
    );
  }

  insertToDatabase({@required title, @required time}) async {
    await database.transaction((txn) {
      txn
          .rawInsert('INSERT INTO task (title,time) VALUES ("$title","$time")')
          .then((value) {
        print("$value inserted successfully");
        emit(AppInsertDataBase());
        getData(database);
      }).catchError((error) {
        print("$error cant insert new record");
      });
      return null;
    });
  }

  bool isbuttomsheet = false;
  IconData navicon = Icons.edit;
  void ButtomSheetChange({
    @required bool IsShown,
    @required IconData icon,
  }) {
    isbuttomsheet = IsShown;
    navicon = icon;
    emit(ChangeButtomEdit());
  }

  // ignore: non_constant_identifier_names
  void DeleteFromDataBase({@required int id}) {
    database.rawDelete('DELETE FROM task WHERE id = ?', [id]).then((value) {
      getData(database);
      emit(AppDeleteDataBase());
    });
  }
  var isDark=true;
  void ChangeAppThem({bool fromCache}){
    if (fromCache!=null){
      isDark=fromCache;
      emit(AppchageThem());
    }
    else{
    isDark=!isDark;
    ChacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppchageThem());
    });
    }
    
  }
}
