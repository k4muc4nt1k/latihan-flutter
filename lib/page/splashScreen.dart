
import 'package:flutter/material.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/model/loginModel.dart';

class SplashScreenPages extends StatelessWidget {
  static const String routeName = "/splash";

  SplashScreenPages();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreenPage();
  }
}

// ignore: must_be_immutable
class SplashScreenPage extends StatefulWidget {
  SplashScreenPage(
      {Key? key})
      : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  String logo = "logo.png";
  AuthService appAuth = new AuthService();
  @override
  void initState() {
    super.initState();
    firstLoad();

  }

  void firstLoad()async{
     LoginModel? lModel= await appAuth.getUser();
    if (lModel!=null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200.0,
                        child: Image.asset(
                          "assets/" + this.logo,
                          fit: BoxFit.contain,
                        )),
                  ],
                ),
              ),
            )));
  }
}