import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/services/navigation_service.dart';

import 'UI/Finance_Dark_theme_UI_Design/screens/finance_home.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
          child: ElevatedButton(
            child: Text(""),
            onPressed: () {
              NavigatorSerice.navigateToScreen(FinanceHome());
              print("object");
            },
          ),
        )));
  }
}
