import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget iconInputBox({IconData? icon}) {
  if (icon != null)
    return Icon(icon);
  else
    return Container();
}

Widget input({
  required TextEditingController txtEditor,
  TextInputType? inputType,
  String? labelText,
  String? hintText,
  Icon? iconKirim,
  IconData? iconKanan,
  int? maxLengths,
  bool? readOnly,
  bool? isRequired,
  bool? obscureText,
  Color? borderColor,
  Color? cursorColor,
  Color? backgoundColor,
  Color? textColor,
  Color? labelColor,
  Color? hintColor,
  String? errorText,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  double? fontSize,
  Function()? actionIconKanan,
  FocusNode? focusNode,
  List<TextInputFormatter>? inputFormatters,
  Function(String)? onChanged,
  bool? actionEnabled,
  Function()? onSubmitted,
  int maxLines = 1
}) {
  if (obscureText == null) obscureText = false;
  if (readOnly == null) readOnly = false;
  if (isRequired == null) isRequired = false;
  if (inputType == null) inputType = TextInputType.text;
  if (backgoundColor == null) backgoundColor = Colors.white;
  if (borderColor == null) borderColor = backgoundColor;
  if (cursorColor == null) cursorColor = Colors.black;
  if (textColor == null) textColor = Colors.black;
  if (labelColor == null) labelColor = Colors.black;
  if (textAlign == null) textAlign = TextAlign.left;
  if (fontWeight == null) fontWeight = FontWeight.normal;
  if (fontSize == null) fontSize = 18;
  if(hintColor==null) hintColor=Colors.black;
  if(inputFormatters==null) inputFormatters = [];
  // print(errorText);
  return
    // Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       border : Border.all(
    //         color: Colors.black,
    //         width: 0,
    //       ),
    //       borderRadius: BorderRadius.circular(12),
    //     ),child:
    //   mainAxisAlignment: MainAxisAlignment.start,
    // children: [
    // Row(mainAxisAlignment: MainAxisAlignment.start,
    // children: [
    //   if(iconKirim!=null)
    //   SizedBox(width: 40,),
    //   Text(labelText??"", style: TextStyle(color: labelColor, fontWeight: FontWeight.normal, fontSize: 16)),
    //   if(isRequired)
    //     Text("*", style: TextStyle(color: Colors.red))
    // ],),
    Column(children: [
      TextField(
        maxLines: maxLines,
        focusNode: focusNode,
        controller: txtEditor,
        obscureText: obscureText,
        maxLength: maxLengths,
        readOnly: readOnly,
        cursorColor: cursorColor,
        keyboardType: inputType,
        textAlign: textAlign,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onEditingComplete: onSubmitted,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          // border:
          // OutlineInputBorder(
          //   gapPadding: 4,
          //   borderRadius: BorderRadius.circular(12),
          //   borderSide: BorderSide(
          //     width: 2,
          //     style: BorderStyle.solid,
          //   ),
          // ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: readOnly?Colors.grey[100]:Colors.white,
          suffixIcon:
          (iconKanan == null
              ? null
              :Container(
              width: 40,
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.black26, width: 1))
              ),
              child:Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 40,
                        margin: EdgeInsets.only(right: 3, bottom: 2, top: 2),
                        decoration: BoxDecoration(
                          color: (actionEnabled??true)?Colors.white:Colors.grey[100],
                          borderRadius: BorderRadius.only(topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                          // border: Border(left: BorderSide(color: Colors.black26, width: 1))
                        ),
                        child:
                        MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed:
                          actionEnabled??true?
                          actionIconKanan == null ? () {} : actionIconKanan
                              :(){},
                          child: Icon(iconKanan, color: actionEnabled??true?textColor:Colors.black54),
                        )
                    )])))
          ,
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: hintColor,
          ),
          alignLabelWithHint: true,

          prefixIcon: iconKirim,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            // fontWeight: FontWeight.bold
          ),
          // errorText: errorText,
          // floatingLabelBehavior:FloatingLabelBehavior.auto,
          // errorText: isRequired
          //     ? txtEditor.text == null || txtEditor.text == ""
          //         ? (errorText == null
          //             ? "Data harus diisi"
          //             : errorText)
          //         : null
          //     : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: ((isRequired
                    && (txtEditor.text == null || txtEditor.text == ""))||errorText!=null)
                    ? Colors.red : Colors.blue
            ),
          ),
          // InputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //     width: 0
          //   ),
          // ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Colors.grey
            ),
          ),
          // UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //       width: 0
          //   ),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Colors.blue
            ),
          ),
          // UnderlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //       width: 0
          //   ),
          // ),
        ),
      ),
      if(errorText!=null)
        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10,),
            Text(errorText, style: TextStyle(fontSize: 8, color: Colors.red),)
          ],)
    ],)
  // ]
  // )
      ;
}
