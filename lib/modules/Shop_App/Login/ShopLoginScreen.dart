import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/Shop_App/Login/Cubit/shopLoginCubit.dart';
import 'package:test1/modules/Shop_App/Login/Cubit/shopLoginStates.dart';
import 'package:test1/modules/Shop_App/Register/ShopRegisterScreen.dart';
import 'package:test1/modules/Shop_App/Shop_Layout/ShopLayoutScreen.dart';
import 'package:test1/network/local/cach_helper.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/const/const.dart';

class ShopLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocProvider(
        create: (BuildContext context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
            listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.model.status) {
              ChacheHelper.saveData(key: "token", value: state.model.data.token)
                  .then((value) {
                token = state.model.data.token;
                navigateAndFinsh(context, ShopLayoutScreen());
              });
            } else {
              showToast(text: state.model.message, state: ToastStates.error);
            }
          }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Title(color: Colors.grey, child: Text("Login")),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login now to get our hot offers',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaulttextfield(
                            lable: 'Email',
                            prefix: Icons.email_outlined,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Email con\'t be empty';
                              }
                            },
                            context: context,
                            type: TextInputType.emailAddress,
                            controller: emailController),
                        SizedBox(
                          height: 20,
                        ),
                        defaulttextfield(
                            isSecure: ShopLoginCubit.get(context).ispass,
                            lable: 'Password',
                            prefix: Icons.lock_open_outlined,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Password con\'t be empty';
                              }
                            },
                            context: context,
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            suffix: ShopLoginCubit.get(context).suffix,
                            suffixPressed: () {
                              ShopLoginCubit.get(context)
                                  .changePasswordVisibilty();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoodingState,
                          builder: (context) {
                            return defaultbutton(
                                onpress: () {
                                  if (formkey.currentState.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'Login');
                          },
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t have an account"),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, ShopRegisterScreen());
                                },
                                child: Text("REGISTER")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
