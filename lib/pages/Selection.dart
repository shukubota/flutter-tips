import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/router/router.dart';

import 'HomeMenu.dart';

class Selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('selection'),
      ),
      body: Center(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Text('selection'),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () =>
                      rootNavigationkey.currentState.pushNamed('/work'),
                  child: Text('toWork'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
