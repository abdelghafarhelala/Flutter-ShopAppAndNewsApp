import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsCubit.dart';
import 'package:test1/layout/buttomnavgationbar/NewsApp/cubit/NewsStates.dart';
import 'package:test1/shared/components/components.dart';

class search extends StatelessWidget {
 var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaulttextfield(
                  lable: 'search',
                  prefix: Icons.search,
                  validate: (String value){
                    if(value.isEmpty)
                      return 'Search must not be empty';
                    return null;
                  },
                  type: TextInputType.text,
                  controller: searchController,
                  context: context,
                  onChange: ( String value){
                    NewsCubit.get(context).getSearchCubit(value);
                  }
                ),
              ),
              Expanded(child: articleBuilder(list,isSearch: true))
        
            ],
        ));
            },
          
    );
      }
}
        
     
    
  
