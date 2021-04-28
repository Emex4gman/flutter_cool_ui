import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/screens/widget/more_menu.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';
import 'dart:math' as math;

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: dHeight * .25,
        width: dHeight * .25,
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(dHeight * .25 * .2),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  CustomPaint(
                    painter: MyPainterArc(color: AppTheme.orange, startAngle: 0, endAngle: -120),
                    size: Size(dHeight * .2 * .80, dHeight * .2 * .80),
                  ),
                  CustomPaint(
                    painter: MyPainterArc(color: AppTheme.orange, startAngle: 0, endAngle: -150),
                    size: Size(dHeight * .2 * .65, dHeight * .2 * .65),
                  ),
                  CustomPaint(
                    painter: MyPainterArc(color: AppTheme.orange, startAngle: 0, endAngle: -120),
                    size: Size(dHeight * .2 * .50, dHeight * .2 * .50),
                  ),
                  Const.h2('Order', context, size: 7),
                  Positioned(bottom: dHeight * .2 * .12, child: Const.h1('4,76k', context)),
                  Positioned(top: -20, right: -20, child: MoreMenuTwo())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainterArc extends CustomPainter {
  MyPainterArc({this.color = Colors.blue, this.endAngle = 0, this.startAngle = 0});
  final Color color;
  final double startAngle;
  final double endAngle;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..color = AppTheme.scaffoldColor
      ..strokeCap = StrokeCap.round;
    Paint paint2 = Paint()
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      0 * (math.pi / 180),
      -180 * (math.pi / 180),
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      startAngle * (math.pi / 180),
      endAngle * (math.pi / 180),
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
