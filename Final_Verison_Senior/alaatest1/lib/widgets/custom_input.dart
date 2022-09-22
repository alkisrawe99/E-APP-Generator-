import 'package:alaatest1/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  final String? hinttext;
  final Function(String)? onchanged;
  final Function (String)?onsubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool ispasswordfield;
  Custominput({ this.hinttext,  this.onchanged,  this.onsubmit,this.focusNode, this.textInputAction, required this.ispasswordfield});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric( vertical: 8.0,horizontal: 24.0),
      decoration: BoxDecoration(color: Color(0xFFF2F2F2),borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        focusNode: focusNode,
        onChanged: onchanged,
        onSubmitted: onsubmit,
        textInputAction: textInputAction,
        obscureText:ispasswordfield,
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: hinttext ?? "hint",
          contentPadding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 18.0),
        ),
        style: Constants.regulardarktext,),);
  }
}
