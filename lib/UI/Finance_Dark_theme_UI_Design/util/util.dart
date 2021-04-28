import 'package:flutter/material.dart';

class Scaler {
  double shortSide = 0;
  Scaler(BuildContext context) {
    shortSide = MediaQuery.of(context).size.shortestSide;
  }
  double sp(double percentage) {
    return ((shortSide) * (percentage / 1000)).ceil().toDouble();
  }
}
