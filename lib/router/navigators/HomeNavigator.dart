import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/HomeMenu.dart';
import 'package:flutter_tips/pages/HomeSubMenu.dart';

import '../../main.dart';

final GlobalKey<NavigatorState> homeNavigationkey =
    new GlobalKey<NavigatorState>();

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homeTab-menu',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        builder = (BuildContext _) => HomeMenu();
        switch (settings.name) {
          case 'homeTab-submenu':
            builder = (BuildContext _) => HomeSubMenu();
            return MaterialPageRoute(builder: builder, settings: settings);
          case 'homeTab-menu':
            builder = (BuildContext _) => HomeMenu();
            return MaterialPageRoute(builder: builder, settings: settings);
          // break;
          default:
            throw Exception();
        }
      },
      key: homeNavigationkey,
    );
  }
}
