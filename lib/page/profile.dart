import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan/widget/dialogs.dart';
import 'package:latihan/widget/loading.dart';
import 'package:latihan/page/splashScreen.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/model/userModel.dart';

class ProfilePages extends StatelessWidget {
  static const String routeName = "/profile";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProfilePage(title: 'Profile');
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage(
      {Key? key,
      this.title = "Profile"})
      : super(key: key);
  final String? title;
  AuthService serv = new AuthService();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _load = false;
  AuthService serv = new AuthService();
  UserModel lm = new UserModel();

  @override
  void initState() {
    super.initState();
    this.getInt();
  }

  getInt() async {
    lm = (await serv.getUserProfile())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Container(decoration: BoxDecoration(color: Colors.blue),),
          elevation: 0,
          title:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(widget.title ?? "")],
            ),),
            Container( margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(height: 38,child:
                IconButton(padding: EdgeInsets.fromLTRB(10, 10, 10, 2), icon: Icon(Icons.key, color: Colors.white, size: 25,), onPressed: (){
                  dialogs(context: context, pesan: "Menu Ganti Password belum tersedia", action: (){Navigator.pop(context);});
                })),
                Text("Ganti Password", style: TextStyle(color: Colors.white, fontSize: 8),)
              ],),),
            Container( margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(height: 38,child:
            IconButton(padding: EdgeInsets.fromLTRB(10, 10, 10, 2), icon: Icon(Icons.exit_to_app, color: Colors.white, size: 25,), onPressed: (){
              dialogConfirm(
                  height: 100,
                  context: context,
                  pesan: "Apakah anda akan keluar?",
                  action: () async{
                    Navigator.pop(context);
                    await serv.logout();
                    Navigator.of(context)
                        .pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return SplashScreenPages();
                      },
                    ));
                  });
            })),
                Text("Log-Out", style: TextStyle(color: Colors.white, fontSize: 8),)
                ],),)
          ],)

        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Stack(children: <Widget>[
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(height: 100, child:
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/user.png",
                            width: 100,
                            height: 100,
                          ),
                          Column(mainAxisAlignment:MainAxisAlignment.end, children: [
                            Container(height: 20, width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                        border: Border.all(color: Colors.black45)
                                ),
                                child:
                                    Center(child:
                              IconButton(padding: EdgeInsets.zero,onPressed: (){
                                dialogs(context: context, pesan: "Menu Edit Profile belum tersedia", action: (){Navigator.pop(context);});
                              }, icon: Icon(Icons.edit, color: Colors.red, size: 14,))
                                    )
                            )
                          ],)
                        ])),
                        SizedBox(height: 10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                  Text(
                                "${lm.namaPengguna}",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ]),
                        SizedBox(height: 5,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                  Text(
                                    "( ${lm.email} )",
                                    style: TextStyle(fontSize: 12),
                                  )
                            ]),
                      ],
                    ))),
                  ])),
              new Align(
                child: _load ? LoadingPage() : Container(),
                alignment: FractionalOffset.center,
              ),
            ])));
  }

  Widget costum({String param = "", String value=""}){
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.only(right: 10),
            child: Text(
              param,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
              child: Text(
                value,
                style: TextStyle(fontSize: 16),
              )),
        ]);
  }
}
