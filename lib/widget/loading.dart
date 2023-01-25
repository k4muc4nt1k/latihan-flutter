
// import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPages extends StatelessWidget {
  static const String routeName = "/contact";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoadingPage();
  }
}

// ignore: must_be_immutable
class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: new Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              // borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child:Center(
        child: LoadingAnimationWidget.prograssiveDots(
        color: Colors.deepPurple,
        size: 80,
    )
        )
        )
    );
  }
}
