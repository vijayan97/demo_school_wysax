import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextStyle {
  final BuildContext context;
  MyTextStyle(this.context);

  static  TextStyle hintStyle = const TextStyle(
    color: Color(0xff707070),
    fontSize: 14,
    fontWeight: FontWeight.normal,
      overflow: TextOverflow.visible
  );
  static  TextStyle simpleTextStyleNormal = const TextStyle(
    color: Color(0xff343434),
    fontSize: 14,
    fontWeight: FontWeight.normal,
      overflow: TextOverflow.visible
  );
  static  TextStyle simpleTextStyle = const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF343434),
          overflow: TextOverflow.visible
  );
  static  TextStyle simpleTextStyleEllipsis = const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF343434),
          overflow: TextOverflow.ellipsis
  );
  static  TextStyle simpleTextStyleFontSize11 = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: Color(0xFF707070),
    overflow: TextOverflow.visible,
  );
  static  TextStyle simpleTextStyleFontSize16Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF343434),
    overflow: TextOverflow.visible,
  );

}