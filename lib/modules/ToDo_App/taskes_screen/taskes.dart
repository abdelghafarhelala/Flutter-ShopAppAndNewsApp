import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/const/const.dart';
import 'package:test1/shared/to_do_cubit/cubit.dart';
import 'package:test1/shared/to_do_cubit/states.dart';

class Taskes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List tasks = AppCubit.git(context).tasks;
        return ListView.separated(
            itemBuilder: (context, index) => buildTasks(tasks[index], context),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
            itemCount: tasks.length);
      },
    );
  }
}
