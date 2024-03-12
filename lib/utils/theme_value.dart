import 'dart:ui';

import 'package:flutter/material.dart';

final bluePrimary         = Color(0xff2584C4);
final blueAccent          = Color(0xff2584C4);
final lightBlueBackground      = Color(0xff2584C4);
final blueScaffoldBackgroundColor  = Color(0xff2584C4);
final blueTextColor = Color(0xFF343434);
final blueGreyTextColor = Color(0xff546167);
final blueCarouselContainerColor = Color(0xff6bbff8);
final blueTextColorLight = Color(0xFF707070);
final blueBottomNavigationBarColor = Color(0xffEAF6FF);
final blueBottomNavigationBarIconColor = Color(0xFFFFFFFF);
final blueDashboardScreenBigPartitionTransparentFilmColor = Color(0xff53a9e3);
final blueGradient1 = Color(0xffb0dcfa);
final blueGradient2 = Color(0xff3f93cb);
final blueText = Color(0xff2680BF);
final unselectedBlueText = Color(0xff4EA3DC);
final canvasShapePainterBlue = Color(0xffCDE3F1);


final blueTheme = ThemeData(

    primarySwatch: Colors.blue,
    primaryColor: bluePrimary,
    hintColor: blueAccent,
    scaffoldBackgroundColor: blueScaffoldBackgroundColor,
    unselectedWidgetColor: unselectedBlueText,
    primaryColorLight: blueCarouselContainerColor,
    primaryColorDark: blueDashboardScreenBigPartitionTransparentFilmColor,
    indicatorColor: blueTextColor,
    highlightColor: blueTextColor,
    popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        textStyle: TextStyle(
            color: blueTextColorLight
        )
    ),
    textTheme: TextTheme(
      labelLarge:TextStyle(
        color: blueTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),labelMedium:TextStyle(
        color: blueTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),labelSmall:TextStyle(
        color: blueTextColorLight,
        fontSize: 12,
        fontWeight: FontWeight.normal
      ),
      headlineLarge: TextStyle(
          color: blueTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
      )

    ).apply(), primaryTextTheme: ThemeData.light().textTheme.apply());