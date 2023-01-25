import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/widget/button.dart';
import 'package:latihan/widget/dialogs.dart';
import 'package:latihan/page/homePages.dart';
import 'package:latihan/widget/input.dart';
import 'package:latihan/widget/loading.dart';
import 'package:latihan/model/loginModel.dart';
import 'package:latihan/model/resultListModel.dart';
import 'package:latihan/service/systemServices.dart' as service;
import 'package:latihan/model/userModel.dart';

class LoginPages extends StatelessWidget {
  static const String routeName = "/login";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginPage(title: 'Flutter Demo Home Page');
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textPassword = TextEditingController();
  TextEditingController textUserName = TextEditingController();
  bool _load = false;
  bool _hidePassword = true;
  IconData rightPassword = Icons.remove_red_eye;
  String version = "";
  String serialNumber = "";
  String? errorMessage;
  AuthService serv = AuthService();

  @override
  void initState() {
    super.initState();
    textUserName.clear();
    textPassword.clear();
    this.version = "0.0.1";
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(decoration: BoxDecoration(
      color: Colors.blue,
    ),
    child:   Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ver. 0.0.1@2022",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              )
            ],
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(children: <Widget>[
              Center(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 50),
                        width: 160,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(100))), child:
                        Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ))),
                    Container(
                        width: 320,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            input(
                                txtEditor: textUserName,
                                inputType: TextInputType.emailAddress,
                                // labelText: "Email / No Telp",
                                hintText: "Username",
                                iconKirim: Icon(Icons.person),
                                onChanged: (val){
                                  setState(() {
                                    this.errorMessage = null;
                                  });
                                },
                                isRequired: true),
                            SizedBox(height: 10),
                            input(
                                txtEditor: textPassword,
                                // labelText: "Password",
                                hintText: "Password",
                                obscureText: _hidePassword,
                                isRequired: true,
                                iconKirim: Icon(Icons.vpn_key_rounded),
                                iconKanan: rightPassword,
                                onChanged: (val){
                                  setState(() {
                                    this.errorMessage = null;
                                  });
                                },
                                actionIconKanan: () {
                                  setState(() {
                                    this._hidePassword = !this._hidePassword;
                                    if (this._hidePassword)
                                      this.rightPassword = Icons.remove_red_eye;
                                    else
                                      this.rightPassword =
                                          Icons.remove_red_eye_outlined;
                                  });
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 30,
                                    child: MaterialButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          dialogs(context: context, pesan: "Menu belum ada", action: ()=>Navigator.pop(context));
                                        },
                                        child: Text(
                                          "Lupa Password?",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )))
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonForm(
                                    onPress: () async {
                                      if (textUserName.text == "" ||
                                          textPassword.text == "") {
                                        dialogs(
                                            context: context,
                                            pesan: "Username / Pasword harus diisi",
                                            action: () {
                                              Navigator.pop(context);
                                            }
                                        );
                                        if (mounted) setState(() {});
                                      } else {
                                        await loginServ();
                                      }
                                    },
                                    color: Colors.white,
                                    textName: "Login",
                                    textStyle:
                                        TextStyle(color: Colors.blue))
                              ],
                            ),

                          ],
                        )),
                  ]))),
              new Align(
                child: _load ? LoadingPage() : Container(),
                alignment: FractionalOffset.center,
              ),
            ])))
    );
  }

  loginServ()async{
    // setState((){
    //   this._load  =true;
    // });
    // ResultListModel rlm = await service.login(
    //     body: {
    //       "username": textUserName.text,
    //       "password": textPassword.text
    //     });
    // setState((){
    //   this._load  =false;
    // });
    // try{
    //   if (rlm.data.runtimeType.toString() == "List<dynamic>") {
    //       serv.setLogin(rlm.data[0]);
    LoginModel lms = new LoginModel(token: "asasas", email: "a@a.com");
    UserModel um = new UserModel(namaPengguna: "Amin", email: "a@a.com", token: "Test");
        serv.setLogin(lms.toMap());
    serv.setUserProfile(um.toMap());
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomePage();
                },
              ));
    //   } else {
    //     dialogs(context: context, pesan: "Error", action: ()=>Navigator.pop(context));
    //   }
    // }catch(e){
    //   dialogs(context: context, pesan: "Error", action: ()=>Navigator.pop(context));
    // }
  }
}
