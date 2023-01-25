import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan/widget/dialogs.dart';
import 'package:latihan/widget/loading.dart';
import 'package:latihan/page/splashScreen.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/model/userModel.dart';

class NewPages extends StatelessWidget {
  static const String routeName = "/new-page";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NewPage(title: 'New Page');
  }
}

class NewPage extends StatefulWidget {
  NewPage(
      {Key? key,
      this.title = "New Page",
      this.datas})
      : super(key: key);
  final String? title;
  List<Map<String, dynamic>>? datas;

  AuthService serv = new AuthService();

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
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
                        for(dynamic data in widget.datas??[])
                          Container(child: Text(data["nama"]),),

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
