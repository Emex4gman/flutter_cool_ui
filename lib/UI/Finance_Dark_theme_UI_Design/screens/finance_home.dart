import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/screens/widget/list_info_card.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';

import 'widget/welcome_card.dart';

class FinanceHome extends StatefulWidget {
  FinanceHome({Key? key}) : super(key: key);

  @override
  _FinanceHomeState createState() => _FinanceHomeState();
}

class _FinanceHomeState extends State<FinanceHome> {
  final _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff26282d),
      Color(0xff26282d),
      Color(0xff292c31),
    ],
  );

  int _selectedIndex = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.battery_charging_full_rounded,
    CupertinoIcons.person,
    Icons.notifications_none_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff292c31),
        systemNavigationBarDividerColor: AppTheme.cardColor,
        systemNavigationBarColor: AppTheme.cardColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          color: AppTheme.cardColor,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _selectedIndex = index;
            setState(() {});
          },
          selectedItemColor: AppTheme.orange,
          unselectedItemColor: AppTheme.iconColorLight,
          items: [
            ...icons.map(
              (e) => BottomNavigationBarItem(
                label: '',
                icon: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      gradient: AppTheme.lighgGradient,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      e,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: _gradient,
                        boxShadow: AppTheme.menuShadow,
                      ),
                      child: Icon(
                        Icons.menu_rounded,
                        color: AppTheme.lightColor,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppTheme.darkColor,
                      maxRadius: 30,
                      child: Image.asset("assets/finance/user2.PNG"),
                    )
                  ],
                ),
              ),
              WelcomeCard(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: 3,
                itemBuilder: (_, index) => ListInfoCard(index % 2 != 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
