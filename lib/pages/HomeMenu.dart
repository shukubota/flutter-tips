import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/components/TodoList.dart';

import '../main.dart';

final GlobalKey<NavigatorState> rootNavigationkey =
    new GlobalKey<NavigatorState>();

class HomeMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('homemenu')),
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Text('Todo List',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
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
