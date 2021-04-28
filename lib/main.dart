import 'package:flutter/material.dart';

import 'entry_page.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cool Ui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EntryPage(),
      navigatorKey: NavigatorSerice.navigationKey,
    );
  }
}
