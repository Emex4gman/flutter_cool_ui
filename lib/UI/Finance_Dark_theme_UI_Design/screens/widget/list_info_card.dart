import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';
import 'dart:math' as math;

class ListInfoCard extends StatelessWidget {
  ListInfoCard(this.isEven);
  final bool isEven;
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isEven ? AppTheme.orange : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Table(
        border: TableBorder(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FractionColumnWidth(.4),
          1: FractionColumnWidth(.30),
          2: FractionColumnWidth(.25),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Const.p("Total Income", context, size: 9),
                  Const.h1("\$1200", context, size: 14),
                ],
              ),
            ),
            Center(
              child: CustomPaint(
                painter: MyPainterArc(),
                size: Size(50, 50),
              ),
            ),
            Center(child: Const.h2("45%", context, color: AppTheme.orange)),
          ])
        ],
      ),
    );
  }
}

class MyPainterArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..color = AppTheme.orange
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width * .4,
      size.height * 1,
      size.width * .5,
      size.height * .6,
    );

    path.quadraticBezierTo(
      size.width * .7,
      size.height * 0,
      size.width,
      size.height * .2,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
