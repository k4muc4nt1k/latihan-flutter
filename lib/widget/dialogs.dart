import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'CostumShowDialog.dart';

void dialogConfirm(
    {required BuildContext context,
    required String pesan,
    required Function() action,
    Widget? header,
    double? height}) {
  if (header == null)
    header = new Row(
      children: [],
    );
  customShowDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        semanticLabel: "",
        content: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: height ?? MediaQuery.of(context).size.height / 4,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFF),
            borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              header!,
              Expanded(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            pesan,
                            maxLines: 11,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ])),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 125,
                      height: MediaQuery.of(context).size.height / 12,
//                    color: Colors.red,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 125,
                          height: MediaQuery.of(context).size.height / 12,
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 0, right: 0),
                          child: Material(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Tidak',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'helvetica_neue_light',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ),
                      )),
                  Container(
                      width: 125,
                      height: MediaQuery.of(context).size.height / 12,
                      child: MaterialButton(
                        onPressed: action,
                        child: Container(
                          width: 125,
                          height: MediaQuery.of(context).size.height / 12,
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 0, right: 0),
                          child: Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Ya',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'helvetica_neue_light',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void dialogs(
    {required BuildContext context,
    required String pesan,
    required Function() action}) {
  customShowDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        semanticLabel: "",
        content: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: 150,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFF),
            borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              pesan,
                              maxLines: 11,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
              MaterialButton(
                onPressed: action,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 0),
                  child: Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
