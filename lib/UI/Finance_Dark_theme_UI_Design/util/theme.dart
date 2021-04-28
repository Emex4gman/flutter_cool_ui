import 'package:flutter/material.dart';

class AppTheme {
  static final lightColor = Color(0xff7e7e86);
  static final scaffoldColor = Color(0xff292c31);
  static final darkColor = Color(0xff26282d);
  static final cardColor = Color(0xff3b4046);
  static final orange = Color(0xffea4c2a);
  static final iconColorLight = Color(0xffb2b4c9);
  static final textColor = Color(0xff737780);
  static final lightGray = Color(0xff878a91);
  //
  static final lighgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppTheme.darkColor,
      // AppTheme.darkColor.withOpacity(.2),
      // AppTheme.cardColor,
      AppTheme.cardColor,
    ],
  );
  static final gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkColor,
      darkColor,
      scaffoldColor,
    ],
  );
  static final menuShadow = [
    BoxShadow(
      color: scaffoldColor,
      offset: Offset(2, 2),
      blurRadius: 2,
      spreadRadius: 1.0,
    ),
    BoxShadow(
      color: scaffoldColor,
      offset: Offset(-2, -2),
      blurRadius: 2,
      spreadRadius: 1.0,
    ),
  ];
}
