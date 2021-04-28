import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';

class GraphPipe extends StatefulWidget {
  GraphPipe({Key? key, this.isEven = false, this.pipeHeight = 100}) : super(key: key);
  final bool isEven;
  final double pipeHeight;

  @override
  _GraphPipeState createState() => _GraphPipeState();
}

class _GraphPipeState extends State<GraphPipe> {
  // late OverlayEntry _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 150 + 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 150 * (widget.pipeHeight / 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    widget.isEven ? AppTheme.iconColorLight : AppTheme.orange,
                    widget.isEven ? AppTheme.iconColorLight : AppTheme.orange,
                    widget.isEven ? AppTheme.iconColorLight.withOpacity(.4) : AppTheme.orange.withOpacity(.4),
                    AppTheme.scaffoldColor.withOpacity(.4),
                    AppTheme.scaffoldColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
          ClipOval(
              child: Container(
            height: 10,
            width: 10,
            color: widget.isEven ? AppTheme.iconColorLight : AppTheme.orange,
          )),
        ],
      ),
    );
  }
}
