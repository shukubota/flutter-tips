import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/router/navigators/HomeNavigator.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:hooks_riverpod/all.dart';

import '../main.dart';

final GlobalKey<NavigatorState> rootNavigationkey =
    new GlobalKey<NavigatorState>();

class HomeMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final value = useProvider(helloProvider) ?? '';
    return Scaffold(
      appBar: AppBar(title: Text('homemenu')),
      body: Column(
        children: [
          Text(value),
          RaisedButton(
            onPressed: () => rootNavigationkey.currentState.pushNamed('/login'),
            child: Text('to login'),
          ),
          RaisedButton(
            onPressed: () =>
                homeNavigationkey.currentState.pushNamed('homeTab-submenu'),
            child: Text('to submenu'),
          ),
        ],
      ),
    );
  }
}
