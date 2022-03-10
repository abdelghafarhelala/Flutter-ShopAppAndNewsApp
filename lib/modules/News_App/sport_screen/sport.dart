import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsCubit.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsStates.dart';
import 'package:test1/shared/components/components.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) {
                return buildArticleItem(list[index], context);
              },
              separatorBuilder: (context, index) {
                return lineSpreate();
              },
              itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
