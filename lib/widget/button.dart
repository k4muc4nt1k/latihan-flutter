import 'dart:convert';

import 'package:flutter/material.dart';

Widget buttonForm(
    {String? textName,
    double? width,
    double? height,
    required Function() onPress,
    Color? color,
      Gradient? gradient,
    double? paddingHorizontal,
    double? paddingVertical,
    Color? borderColor,
    TextAlign? textAlign,
    TextStyle? textStyle,
    Widget? costumWidget,
      double borderRadius = 10
    }) {
  if(costumWidget==null) costumWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        textName == null ? "" : textName,
        textAlign: textAlign,
        style: textStyle,
      )
    ],
  );
  if (paddingHorizontal == null) paddingHorizontal = 20.0;
  if (paddingVertical == null) paddingVertical = 10.0;
  if (textAlign == null) textAlign = TextAlign.center;
  if (borderColor == null) borderColor = Colors.blue;
  if (textStyle == null)
    textStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  if (width == null) {
    return Expanded(
      child: Container(
        height: height,
        // elevation: 5.0,
        // borderRadius: BorderRadius.circular(10.0),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(width: 1, color: borderColor),
        ),

        child: MaterialButton(
          minWidth: 120,
          padding: EdgeInsets.fromLTRB(
            paddingHorizontal,
            paddingVertical,
            paddingHorizontal,
            paddingVertical,
          ),
          onPressed: onPress,
          child: costumWidget,
        ),
      ),
    );
  } else {
    return Container(
      height: height,
      width: width,
      // elevation: 5.0,
      // borderRadius: BorderRadius.circular(10.0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(width: 1, color: borderColor),
      ),

      child: MaterialButton(
        minWidth: 120,
        padding: EdgeInsets.fromLTRB(
          paddingHorizontal,
          paddingVertical,
          paddingHorizontal,
          paddingVertical,
        ),
        onPressed: onPress,
        child: costumWidget,
      ),
    );
  }
}
