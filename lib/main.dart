import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/pages/HomeMenu.dart';
import 'package:flutter_tips/pages/HomeSubMenu.dart';
import 'package:flutter_tips/pages/ProgressMenu.dart';
import 'package:flutter_tips/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state = state + 1;
}

void main() {
  runApp(ProviderScope(child: FlutterTips()));
}

class FlutterTips extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      print('useEffect');
      return null;
    });
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: router,
      initialRoute: '/',
      navigatorKey: rootNavigationkey,
    );
  }
}
