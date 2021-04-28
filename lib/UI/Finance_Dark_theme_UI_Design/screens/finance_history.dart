import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';
import 'package:flutter_cool_ui/services/navigation_service.dart';

import 'widget/earning_card.dart';
import 'widget/graph_overlay.dart';
import 'widget/graph_pipe.dart';
import 'widget/more_menu.dart';

class FinanceHistory extends StatefulWidget {
  @override
  _FinanceHistoryState createState() => _FinanceHistoryState();
}

class _FinanceHistoryState extends State<FinanceHistory> {
  Random _random = new Random();
  String _selectedMonth = '';
  bool _isSelected(String val) => _selectedMonth == val;
  _showOverlay(BuildContext contxt, TapDownDetails details, String month) async {
    var renderBox = contxt.findRenderObject() as RenderBox;
    final width = MediaQuery.of(context).size.width;
    // print(renderBox.localToGlobal(details.globalPosition));
    var _tapPosition = renderBox.localToGlobal(details.globalPosition);

    print(width);
    print(_tapPosition.dx);
    print(width - _tapPosition.dx);
    var overlayState = Overlay.of(contxt);
    OverlayEntry _overlayEntry = OverlayEntry(
      builder: (contxt) => Positioned(
        top: 150,
        right: width - _tapPosition.dx - 60,
        child: GraphOverlay(month),
      ),
    );

    overlayState?.insert(_overlayEntry);

    await Future.delayed(Duration(seconds: 3));
    _overlayEntry.remove();
    // return
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => NavigatorSerice.goBack(),
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: AppTheme.gradient,
                            boxShadow: AppTheme.menuShadow,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppTheme.lightColor,
                          ),
                        ),
                      ),
                      MoreMenu(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Const.p('History', context, color: Colors.white)),
                    Container(
                      width: 60,
                      child: DropdownButtonFormField<String>(
                          onChanged: (val) {},
                          value: "Jan",
                          hint: Text("data"),
                          decoration: InputDecoration(border: InputBorder.none),
                          dropdownColor: AppTheme.scaffoldColor,
                          items: ['Jan', 'Feb']
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Const.p(e, context, color: Colors.white),
                                  ))
                              .toList()),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...months.map(
                      (month) => Column(
                        children: [
                          GraphPipe(
                            isEven: months.indexOf(month) % 2 == 0,
                            pipeHeight: _random.nextInt(100 - 20) + 20,
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTapDown: (tap) {
                              _showOverlay(context, tap, month);
                            },
                            onTap: () {
                              // print(tap);
                              setState(() {
                                _selectedMonth = month;
                              });
                              // _showOverlay(context, tap);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: _isSelected(month) ? AppTheme.gradient : null,
                                  boxShadow: null,
                                ),
                                child: Const.p(month, context, color: _isSelected(month) ? AppTheme.orange : AppTheme.textColor)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                EarningCard(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// const months = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
