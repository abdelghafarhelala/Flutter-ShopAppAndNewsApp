import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/ShopApp_models/ChangeFavoritesModel.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is ! ShopLoadingFavoriteDataState,
          builder:(context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildFavoriteItem(
                  ShopCubit.get(context).changeFavoriteModel.data.data[index],
                  context),
              separatorBuilder: (context, index) => lineSpreate(),
              itemCount:
                  ShopCubit.get(context).changeFavoriteModel.data.data.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavoriteItem(FavData model, context) => Padding(
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
                    image: NetworkImage(model.product.image),
                    height: 120.0,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  if (model.product.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: Text(
                        "DISCOUNT",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
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
                      model.product.name,
                      style: TextStyle(fontSize: 14, height: 1.3),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.product.price.round()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: default_Color,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.product.discount != 0)
                          Text(
                            '${model.product.oldPrice.round()}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              print(model.id);

                              ShopCubit.get(context)
                                  .changeFavorites(model.product.id);
                            },
                            icon: CircleAvatar(
                                radius: 15,
                                backgroundColor: ShopCubit.get(context)
                                        .favorites[model.product.id]
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
