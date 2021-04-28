import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/services/navigation_service.dart';

import 'UI/Finance_Dark_theme_UI_Design/screens/finance_home.dart';

class EntryPage extends StatelessWidget {
  EntryPage({Key? key}) : super(key: key);
  final List<String> _images = ["assets/screenshot/finance1.jpeg"];
  final List<Widget> _uis = [FinanceHome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: _images.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => NavigatorSerice.navigateToScreen(_uis[index]),
              child: Container(
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
