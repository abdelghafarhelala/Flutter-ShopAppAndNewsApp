import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/ShopCubit.dart';
import 'package:test1/modules/Shop_App/Shop_cubit/States.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/const/const.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopCubit.get(context).userModel;

          nameController.text = model.data.name;
          emailController.text = model.data.email;
          phoneController.text = model.data.phone;
          return ConditionalBuilder(
            condition: ShopCubit.get(context).userModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is ShopLoadingUpdateProfileDataState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    defaulttextfield(
                      lable: 'Name',
                      prefix: Icons.person,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Name Can\'t be Empty';
                        }
                      },
                      context: context,
                      type: TextInputType.name,
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaulttextfield(
                      lable: 'Email Address',
                      prefix: Icons.email,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Email Can\'t be Empty';
                        }
                      },
                      context: context,
                      type: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaulttextfield(
                      lable: 'Phone',
                      prefix: Icons.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Phone Can\'t be Empty';
                        }
                      },
                      context: context,
                      type: TextInputType.phone,
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbutton(
                      onpress: () {
                        if (formKey.currentState.validate()) {
                          ShopCubit.get(context).updaterUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      text: 'UPDATE',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbutton(
                        onpress: () {
                          logOut(context);
                          print(model.data.token);
                          print(model.data.name);
                        },
                        text: 'LOGOUT'),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
