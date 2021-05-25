// routing
import 'package:flutter/cupertino.dart';
import 'package:flutter_tips/pages/Complete.dart';
import 'package:flutter_tips/pages/HomeMenu.dart';
import 'package:flutter_tips/pages/HomeSubMenu.dart';
import 'package:flutter_tips/pages/Selection.dart';
import 'package:flutter_tips/pages/Work.dart';
import 'TopRouter.dart';

final GlobalKey<NavigatorState> rootNavigationkey =
    new GlobalKey<NavigatorState>();

Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => MyHomePage(title: '/'),
  '/selection': (BuildContext context) => Selection(),
  '/work': (BuildContext context) => Work(),
  '/complete': (BuildContext context) => Complete(),
};

// Map<String, WidgetBuilder> homeRouter = {
//   'homeTab-menu': (BuildContext context) => HomeMenu(),
//   'homeTab-submenu': (BuildContext context) => HomeSubMenu(),
// };
