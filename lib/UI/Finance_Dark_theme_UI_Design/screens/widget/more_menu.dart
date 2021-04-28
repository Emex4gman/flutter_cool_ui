import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';

class MoreMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.darkColor,
              AppTheme.darkColor.withOpacity(.7),
              AppTheme.cardColor,
            ],
          )),
      child: Icon(
        Icons.more_vert_rounded,
        color: AppTheme.lightColor,
      ),
    );
  }
}

class MoreMenuTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.darkColor,
              AppTheme.darkColor.withOpacity(.7),
              AppTheme.cardColor,
            ],
          )),
      child: Icon(
        Icons.arrow_drop_down,
        color: AppTheme.lightColor,
      ),
    );
  }
}
