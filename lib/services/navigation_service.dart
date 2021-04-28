import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorSerice {
  static final _instance = NavigatorSerice.instance();
  NavigatorSerice.instance();
  factory NavigatorSerice() => _instance;
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  dynamic _goBack([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  static dynamic goBack([dynamic popValue]) => NavigatorSerice()._goBack(popValue);

  static Future<dynamic> navigateToScreen(Widget page, {arguments}) async {
    return await NavigatorSerice()._navigateToScreen(page, arguments: arguments);
  }

  Future<dynamic> _navigateToScreen(Widget page, {arguments}) async => navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  static Future<dynamic> replaceScreen(Widget page, {arguments}) async => await NavigatorSerice()._replaceScreen(page, arguments: arguments);

  Future<dynamic> _replaceScreen(Widget page, {arguments}) async => navigationKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  void _popToFirst() => navigationKey.currentState?.popUntil((route) => route.isFirst);
  static void popToFirst() => NavigatorSerice()._popToFirst();
}
