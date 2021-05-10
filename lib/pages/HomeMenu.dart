import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/components/TodoList.dart';

final GlobalKey<NavigatorState> rootNavigationkey =
    new GlobalKey<NavigatorState>();

class HomeMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('やることりすと')),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            TodoList(),
            // RaisedButton(
            //   onPressed: () => rootNavigationkey.currentState.pushNamed('/login'),
            //   child: Text('to login'),
            // ),
            // RaisedButton(
            //   onPressed: () =>
            //       homeNavigationkey.currentState.pushNamed('homeTab-submenu'),
            //   child: Text('to submenu'),
            // ),
          ],
        ),
      ),
    );
  }
}
