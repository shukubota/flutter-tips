import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/router/router.dart';

import 'HomeMenu.dart';

class Complete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('complete'),
      ),
      body: Center(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Text('complete'),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    rootNavigationkey.currentState.popUntil((route) {
                      print(route.settings.name);
                      return ['/selection', '/'].contains(route.settings.name);
                    });
                  },
                  child: Text('toSelection'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
