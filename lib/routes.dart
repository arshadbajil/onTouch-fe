import 'package:flutter/widgets.dart';
import 'package:on_touch/src/Screens/Home/welcomePage.dart';
import 'package:on_touch/src/Screens/Auth/loginPage.dart';
import 'package:on_touch/src/Screens/Auth/signup.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => WelcomePage(),
  "/app/login": (BuildContext context) => LoginPage(),
  "/app/sign-up": (BuildContext context) => SignUpPage(),
};
