import 'package:flutter/material.dart';
import 'package:latihan/Profile.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/page/homePages.dart';
import 'package:latihan/page/login.dart';
import 'package:latihan/page/splashScreen.dart';

AuthService appAuth = new AuthService();

void main() {
  Widget _defaultHome = new SplashScreenPages();
  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: <String, WidgetBuilder>{
      SplashScreenPages.routeName: (BuildContext context) => new SplashScreenPages(),
      HomePages.routeName: (BuildContext context) => new HomePages(),
      ProfilePages.routeName: (BuildContext context) => new ProfilePages(),
      LoginPages.routeName: (BuildContext context) => new LoginPages(),
    },
  ));
}
