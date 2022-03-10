import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/SearchModel.dart';
import 'package:test1/modules/Shop_App/Shop_Search/Cubit/Search_Cubit.dart';
import 'package:test1/modules/Shop_App/Shop_Search/Cubit/Search_states.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/styles/colors.dart';

// ignore: must_be_immutable
class ShopSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaulttextfield(
                      lable: 'Search',
                      prefix: Icons.search,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'You Must Write A text to Search';
                        }
                        return null;
                      },
                      context: context,
                      type: TextInputType.text,
                      controller: searchController,
                      onChange: (String text) {
                        SearchCubit.git(context).search(text);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  if (state is SearchLoadingState) LinearProgressIndicator(),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => buildSearchItem(
                              SearchCubit.git(context).model.data.data[index],
                              context),
                          separatorBuilder: (context, index) => lineSpreate(),
                          itemCount:
                              SearchCubit.git(context).model.data.data.length),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSearchItem(Product model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 120,
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    height: 120.0,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  // if (model.discount != 0)
                  //   Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 5),
                  //     color: Colors.red,
                  //     child: Text(
                  //       "DISCOUNT",
                  //       style: TextStyle(color: Colors.white, fontSize: 10),
                  //     ),
                  //   )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(fontSize: 14, height: 1.3),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.price}',
                          style: TextStyle(
                            fontSize: 12,
                            color: default_Color,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        // if (model.discount != 0)
                        //   Text(
                        //     '${model.oldPrice}',
                        //     style: TextStyle(
                        //       fontSize: 11,
                        //       color: Colors.grey,
                        //       decoration: TextDecoration.lineThrough,
                        //     ),
                        //   ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              print(model.id);

                              ShopCubit.get(context).changeFavorites(model.id);
                            },
                            icon: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    ShopCubit.get(context).favorites[model.id]
                                        ? Colors.red[400]
                                        : Colors.grey[300],
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
