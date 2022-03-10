import 'package:flutter/material.dart';
import 'package:test1/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emaillcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defaulttextfield(
                context: context,
                  lable: 'Email',
                  prefix: Icons.email,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) return 'E-mail can not be empty';
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              defaulttextfield(
                context: context,
                  lable: 'Password',
                  prefix: Icons.lock,
                  type: TextInputType.visiblePassword,
                  isSecure: ispassword,
                  suffix: ispassword ? Icons.visibility : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                      ispassword = !ispassword;
                    });
                  },
                  validate: (String value) {
                    if (value.isEmpty) return 'Password can not be empty';
                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              defaultbutton(
                  onpress: () {
                    if (formkey.currentState.validate()) {
                      print(passwordcontroller);
                      print(emaillcontroller);
                    }
                  },
                  text: 'Login'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account"),
                  TextButton(onPressed: () {}, child: Text("Register")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
