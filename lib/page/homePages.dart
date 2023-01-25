import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latihan/Profile.dart';
import 'package:latihan/page/dashboard.dart';


class HomePages extends StatelessWidget {
  static const String routeName = "/home";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _page = 0;
  List<Widget> buildScreen = [];
  double notchTop = 0.0;
  bool isFirst = true;
  int _selectedIndex =0;
  int _selectedIndexTemp =0;
  PageController _pageController = PageController();

  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  bool showMenu = false;
  Widget body = Container();

  @override
  void initState() {

    super.initState();
    this.body = DashboardPages();
    setState(() {});
    _pageController = PageController();
    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor: HexColor('#373A36'),
    //   systemNavigationBarIconBrightness: Brightness.light,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemTheme);
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);


    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  bool myInterceptor(bool stopDefaultButtonEvent) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets ed = MediaQuery.of(context).viewPadding;

    return new WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      body:  body,
      bottomNavigationBar: buttonNarBar(
        activeColor: Colors.blueAccent,
          inactiveColor: Colors.black45
      )
    ));
  }

  Widget buttonCostum(
      {required String name,
        required String image,
        required Function() onPressed}) {
    return Container(
      height: 90,
      width: 90,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19), color: Color(0xffffffff),
        border: Border.all(color:Colors.grey.withOpacity(0.5)),),

      child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 34,
                height: 34,
                child: Image(image: AssetImage("assets/" + image + ".png"))),

            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      fontFamily: "Helvetica",
                      color: Color(0xff71B1CB)))
              )
            ],)
          ])),
    );
  }

  Widget buttonNarBar({Color activeColor = Colors.blue,
  Color? inactiveColor}){
    Color activeColor = Colors.red;
    double containerHeight = 56;
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // if (showElevation)
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              buttonBotomNavbar(icon: Icon(Icons.home_outlined),
              activeColor: activeColor,
              onItemSelected: (){
                this.body = DashboardPage(title: "Dashboard");
                if(mounted)
                setState((){
                  this._selectedIndex = 0;
                });
                  },
                inactiveColor:inactiveColor,
                title: "Home",
                isSelected: this._selectedIndex==0
              ),
              buttonBotomNavbar(icon: Icon(Icons.history),
                  activeColor: activeColor,
                  onItemSelected: (){
                    this.body = new Center(child: Text("Pesan Belum Tersedia"),);
                    if(mounted)
                    setState((){
                      this._selectedIndex = 1;
                    });
                  },
                  inactiveColor:inactiveColor,
                  title: "History",
                  isSelected: this._selectedIndex==1
              ),
              buttonBotomNavbar(icon: Icon(Icons.message),
                  activeColor: activeColor,
                  onItemSelected: (){
                    this.body = new Center(child: Text("Pesan Belum Tersedia"),);
                    if(mounted)
                    setState((){
                      this._selectedIndex = 2;
                    });
                  },
                  inactiveColor:inactiveColor,
                  title: "Pesan",
                  isSelected: this._selectedIndex==2
              ),
              buttonBotomNavbar(icon: Icon(Icons.person),
                  activeColor: activeColor,
                  onItemSelected: (){
                    this.body = ProfilePage(title: "Profile",);
                    if(mounted)
                      setState((){
                        this._selectedIndex = 3;
                      });
                  },
                  inactiveColor:inactiveColor,
                  title: "Profile",
                  isSelected: this._selectedIndex==3
              )
            ]),
        ),
      ),
    );
  }

  Widget buttonBotomNavbar({
    required Function() onItemSelected,
    bool isSelected = false,
    double iconSize=24,
    required Icon icon,
  required Color activeColor,
    Color? inactiveColor,
  String? title}){
    return
      Container(width: 90,child:
      GestureDetector(
      onTap: onItemSelected,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              size: isSelected?30:iconSize,
              color: isSelected
                  ? activeColor.withOpacity(1)
                  : inactiveColor == null
                  ? activeColor
                  : inactiveColor,
            ),
            child: icon,
          )
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    color: isSelected
                        ? activeColor.withOpacity(1)
                        : inactiveColor == null
                        ? activeColor
                        : inactiveColor,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  child: Text(title??"", style: TextStyle(fontSize: 10),),
                ),
              ),
            )
          ],)
      ]),
    )
      );
  }

}