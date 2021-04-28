import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/util.dart';
import 'package:google_fonts/google_fonts.dart';

const months = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

class Const {
  static Text h1(String text, BuildContext context, {Color? color = Colors.white, double size = 10}) {
    Scaler scaler = Scaler(context);
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        fontSize: textSize(context, scaler.sp(size)),
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Text h2(String text, BuildContext context, {Color color = Colors.white, double size = 8}) {
    Scaler scaler = Scaler(context);
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        fontSize: textSize(context, scaler.sp(size)),
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Text p(String text, BuildContext context, {Color color = const Color(0xff737780), double size = 7}) {
    Scaler scaler = Scaler(context);
    return Text(
      text,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        fontSize: textSize(context, scaler.sp(size)),
        color: color,
      ),
    );
  }

  static double textSize(BuildContext context, double size) {
    double viewPortwidth = MediaQuery.of(context).size.shortestSide;
    viewPortwidth = viewPortwidth > 500 ? 500 : viewPortwidth;
    return size * (viewPortwidth / 100);
  }
}
