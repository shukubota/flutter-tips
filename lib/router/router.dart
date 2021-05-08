// routing
import 'package:flutter/cupertino.dart';
import 'package:flutter_tips/pages/HomeMenu.dart';
import 'package:flutter_tips/pages/HomeSubMenu.dart';
import 'package:flutter_tips/pages/Login.dart';
import '../main.dart';
import 'TopRouter.dart';

Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => MyHomePage(title: '/'),
  '/login': (BuildContext context) => Login(),
};

Map<String, WidgetBuilder> homeRouter = {
  'homeTab-menu': (BuildContext context) => HomeMenu(),
  'homeTab-submenu': (BuildContext context) => HomeSubMenu(),
};
