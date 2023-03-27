import 'package:flutter/material.dart';
import 'package:flutter_login/components/logo.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: Size(double.infinity, 60),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {

  // 1. GlobalKey를 만든다.
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Logo("Login"),
          Form(
            key: _formKey, //2.GlobalKey를 연결한다.
            child: Column(
              children: [
                CustomeTextFormField("email"),
                CustomeTextFormField("password", isObscure: true),
                TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, "/home");
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Logo("Care Soft"),
          SizedBox(height: 50),
          TextButton(
              onPressed:(){
                Navigator.pop(context);
    },
            child: Text("Get Started"),
          ),
        ],
      ),
    );
  }
}
