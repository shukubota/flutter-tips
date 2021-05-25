import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/router/router.dart';

class HomeSubMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('submenu')),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  rootNavigationkey.currentState.pushNamed('/selection'),
              child: Text('to selection'),
            ),
            ElevatedButton(
              onPressed: () =>
                  rootNavigationkey.currentState.pushNamed('/complete'),
              child: Text('to complete'),
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
