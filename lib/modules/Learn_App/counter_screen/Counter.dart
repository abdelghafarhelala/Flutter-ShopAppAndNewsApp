import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/counter_cubit/cubit.dart';
import 'package:test1/shared/counter_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu),
              title: Text("data"),
              actions: [
                Icon(Icons.search),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    defaultbutton(
                      onpress: () {
                        CounterCubit.get(context).Plus();
                      },
                      text: "plus",
                      width: 150,
                      color: Colors.blue,
                      radius: 10,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("${CounterCubit.get(context).count}"),
                    SizedBox(
                      width: 20,
                    ),
                    defaultbutton(
                      onpress: () {
                        CounterCubit.get(context).Minus();
                      },
                      text: "Mins",
                      width: 150,
                      color: Colors.blue,
                      radius: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
