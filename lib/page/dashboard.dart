import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan/model/userModel.dart';
import 'package:latihan/page/newPage.dart';
import 'package:latihan/temp/authService.dart';
import 'package:latihan/widget/dialogs.dart';
import 'package:latihan/widget/loading.dart';

class DashboardPages extends StatelessWidget {
  static const String routeName = "/dashboard";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DashboardPage(title: 'Flutter Demo Home Page');
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _load = false;
  String serialNumber = "";
  String? errorMessage;
  AuthService serv = new AuthService();
  String nama = "";
  UserModel? lm;

  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit() async {
    lm = await serv.getUserProfile();
    this.nama = lm!.namaPengguna!;
    if (mounted) setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var heigth = screenSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    // Widget loadingIndicator = _load ? wLoading(width: width) : new Container();

    return Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                child: Stack(children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: safePadding+10, right: 10, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/user.png",
                                      width: 35,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Row(children: [
                                          Text(
                                            "Halo, ",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14),
                                          )
                                        ]),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(this.nama,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)))
                                          ],
                                        )
                                      ],
                                    ))
                                  ],
                                )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(100))), child:
                                    Image.asset(
                                      "assets/logo.png",
                                      width: 35,
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 3,
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            // child: SingleChildScrollView(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 3),

                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        buttonMenu(
                                            onPressed: () async {
                                              await Navigator.of(context)
                                                  .push(CupertinoPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return NewPages();
                                                },
                                              ));
                                            },
                                            color: Colors.blue,
                                            color_text: Colors.black,
                                            name: "Antrian Pasien",
                                            info: "",
                                            logo: "logo"),
                                        buttonMenu(
                                            onPressed: () async {
                                              // await Navigator.of(context)
                                              //     .push(CupertinoPageRoute(
                                              //   builder:
                                              //       (BuildContext context) {
                                              //     return NewPage();
                                              //   },
                                              // ));
                                            },
                                            name: "Jasa",
                                            info: "",
                                            logo: "logo"),
                                        buttonMenu(
                                            onPressed: () {
                                              dialogs(context: context, pesan: "Menu Jadwal belum tersedia", action:()=> Navigator.pop(context));
                                            },
                                            name: "Jadwal",
                                            info: "",
                                            logo: "logo"),
                                        buttonMenu(
                                            onPressed: () {
                                              dialogs(context: context, pesan: "Menu Riwayat belum tersedia", action:()=> Navigator.pop(context));
                                            },
                                            name: "Riwayat",
                                            info: "",
                                            logo: "logo")
                                      ],
                                    ),
                                  ),
                                ])
                            // )
                        )),
                  ],
                ),
              ),
              new Align(
                child: _load ? LoadingPage() : Container(),
                alignment: FractionalOffset.center,
              ),
            ]))));
  }

  Widget buttonMenu(
      {required String logo,
      required String name,
      required String info,
      Color color = Colors.white,
      Color color_text = Colors.black,
      required Function() onPressed}) {
    return Expanded(
        child: Column(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: clr.biruMuda),
              color: color,
              boxShadow: [
                // color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    3.0, // Move to right 10  horizontally
                    3.0, // Move to bottom 10 Vertically
                  ),
                )
              ]),
          // width: 160,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          child: MaterialButton(
              onPressed: onPressed,
              child: Center(
                  child: Image.asset(
                "assets/${logo}.png",
                // width: 40,
                // height: 40,
              )))),
      SizedBox(
        height: 2,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            name,
            style: TextStyle(fontSize: 12, color: color_text),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    ]));
  }
}
