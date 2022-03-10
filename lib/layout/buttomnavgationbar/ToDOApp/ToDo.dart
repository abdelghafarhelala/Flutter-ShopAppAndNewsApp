import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/to_do_cubit/cubit.dart';
import 'package:test1/shared/to_do_cubit/states.dart';

class Hometaskes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scafoldkey = GlobalKey<ScaffoldState>();

    var titlecontroller = TextEditingController();
    var timecontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createdatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.git(context);
            return Scaffold(
              key: scafoldkey,
              appBar: AppBar(
                title: Text(cubit.titles[cubit.current]),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.current,
                onTap: (index) {
                  cubit.ChangeNav(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'New Task'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.done,
                      ),
                      label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive), label: 'archived'),
                ],
              ),
              body: cubit.screens[cubit.current],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isbuttomsheet) {
                    if (formkey.currentState.validate()) {
                      cubit.insertToDatabase(
                          title: titlecontroller.text,
                          time: timecontroller.text);
                      Navigator.pop(context);
                      cubit.ButtomSheetChange(IsShown: false, icon: Icons.edit);
                    }
                  } else {
                    scafoldkey.currentState
                        .showBottomSheet(
                          (context) => Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.grey[200],
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaulttextfield(
                                    context: context,
                                    lable: "Task Title",
                                    prefix: Icons.title,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Title Cant be empty';
                                      }
                                      return null;
                                    },
                                    type: TextInputType.text,
                                    controller: titlecontroller,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  defaulttextfield(
                                    context: context,
                                      lable: "Task Time",
                                      prefix: Icons.watch,
                                      validate: (String value) {
                                        if (value.isEmpty) {
                                          return 'Time Cant be empty';
                                        }
                                        return null;
                                      },
                                      type: TextInputType.number,
                                      controller: timecontroller,
                                      ontap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timecontroller.text =
                                              value.format(context).toString();
                                        });
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                        .closed
                        .then((value) {
                      cubit.ButtomSheetChange(IsShown: false, icon: Icons.edit);
                    });
                    cubit.ButtomSheetChange(
                      IsShown: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(cubit.navicon),
              ),
            );
          }),
    );
  }
}
