import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/screens/widget/more_menu.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/screens/widget/order_widget.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';
import 'dart:math' as math;

class EarningCard extends StatelessWidget {
  _showOverlay(BuildContext contxt, TapDownDetails details) async {
    var renderBox = contxt.findRenderObject() as RenderBox;
    final width = MediaQuery.of(contxt).size.width;
    var _tapPosition = renderBox.localToGlobal(details.globalPosition);
    var overlayState = Overlay.of(contxt);
    OverlayEntry _overlayEntry = OverlayEntry(
      builder: (contxt) => Positioned(
        top: 150,
        right: width - _tapPosition.dx - 60,
        child: OrderWidget(),
      ),
    );

    overlayState?.insert(_overlayEntry);

    await Future.delayed(Duration(seconds: 3));
    _overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, ori) {
      final dHeight = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;

      return Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(25),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Const.h2("Earnings", context, color: AppTheme.textColor),
                      Const.h1("\$5078.78", context),
                      Const.p("Profit is 20% More than last Month", context),
                      SizedBox(height: 20),
                      ClipOval(
                        child: Container(
                            height: dHeight * .25,
                            width: dHeight * .25,
                            decoration: BoxDecoration(gradient: AppTheme.lighgGradient),
                            child: Center(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  CustomPaint(
                                    painter: MyPainter(color: AppTheme.cardColor, startAngle: -90, endAngle: -180),
                                    size: Size(dHeight * .25 * .70, dHeight * .25 * .70),
                                  ),
                                  CustomPaint(
                                    painter: MyPainter(color: AppTheme.lightGray, startAngle: 0, endAngle: 130),
                                    size: Size(dHeight * .25 * .70, dHeight * .25 * .70),
                                  ),
                                  CustomPaint(
                                    painter: MyPainter(color: AppTheme.lightGray, startAngle: -90, endAngle: 90),
                                    size: Size(dHeight * .25 * .80, dHeight * .25 * .80),
                                  ),
                                  CustomPaint(
                                    painter: MyPainter(color: AppTheme.orange, startAngle: 0, endAngle: 90),
                                    size: Size(dHeight * .25, dHeight * .25),
                                    child: Center(
                                      child: GestureDetector(
                                        onTapDown: (tap) => _showOverlay(context, tap),
                                        onTap: () {},
                                        child: ClipOval(
                                          child: Container(
                                            height: dHeight * .25 * .45,
                                            width: dHeight * .25 * .45,
                                            color: AppTheme.scaffoldColor,
                                            child: Center(child: Const.h1("35%", context)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  Positioned(right: 5, top: 5, child: MoreMenu()),
                ],
              ),
            ),
          ),
          Container(
            width: 30,
            height: dHeight * .25 * .25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: AppTheme.orange,
            ),
            child: Center(
                child: Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 35,
            )),
          ),
        ],
      );
    });
  }
}

class MyPainter extends CustomPainter {
  MyPainter({this.color = Colors.blue, this.endAngle = 0, this.startAngle = 0});
  final Color color;
  final double startAngle;
  final double endAngle;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      startAngle * (math.pi / 180),
      endAngle * (math.pi / 180),
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
