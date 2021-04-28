import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';

class GraphOverlay extends StatelessWidget {
  GraphOverlay(this.month);
  final String month;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60), right: Radius.circular(60)),
          color: AppTheme.cardColor,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Const.h2("15", context, color: AppTheme.orange, size: 5),
                      Const.p("Min", context, color: AppTheme.orange, size: 3),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Const.h1("\$2954", context, color: Colors.white, size: 9),
                Const.p("$month 1 2021", context, color: Colors.white, size: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
