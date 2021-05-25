import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/components/Counter.dart';
import 'package:flutter_tips/components/AnotherCounter.dart';
import 'package:flutter_tips/components/TodoList.dart';
import 'package:flutter_tips/router/navigators/HomeNavigator.dart';
import 'package:flutter_tips/router/router.dart';

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
            CounterComponent(),
            const Padding(padding: EdgeInsets.only(top: 10)),
            AnotherCounterComponent(),
            TodoList(),

            ElevatedButton(
              onPressed: () =>
                  homeNavigationkey.currentState.pushNamed('homeTab-submenu'),
              // rootNavigationkey.currentState.pushNamed('/login'),
              child: Text('to submenu'),
            ),
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
