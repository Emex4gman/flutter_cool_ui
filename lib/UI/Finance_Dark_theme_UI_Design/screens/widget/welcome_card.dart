import 'package:flutter/material.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/const.dart';
import 'package:flutter_cool_ui/UI/Finance_Dark_theme_UI_Design/util/theme.dart';
import 'package:flutter_cool_ui/services/navigation_service.dart';

import '../finance_history.dart';

class WelcomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, ori) {
      final dHeight = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;

      final dWidth = MediaQuery.of(context).size.width;

      return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () => NavigatorSerice.navigateToScreen(FinanceHistory()),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: dHeight * .25,
                  padding: EdgeInsets.all(dHeight * .25 * .12),
                  decoration: BoxDecoration(color: AppTheme.cardColor, borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Const.h1('Hi Ghulam', context),
                            Const.p('Welcome Back', context),
                            Expanded(child: SizedBox()),
                            Const.p('Balance', context),
                            Const.h1('\$92,510', context),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
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
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            width: dWidth * .23,
                            height: dHeight * .10,
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
                              ),
                            ),
                            child: Center(
                              child: Const.h2(
                                "↓ 5.9%",
                                context,
                                color: AppTheme.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
