import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/HomeMenu.dart';
import 'package:flutter_tips/router/router.dart';

class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('work'),
      ),
      body: Center(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Text('work'),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () => rootNavigationkey.currentState
                      .pushReplacementNamed('/complete'),
                  child: Text('toComplete'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
