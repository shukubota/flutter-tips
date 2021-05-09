import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/pages/ProgressMenu.dart';

import '../main.dart';
import 'navigators/HomeNavigator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('TODO'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('DONE'),
          ),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Offstage(
            offstage: _tabIndex != 0,
            child: HomeNavigator(),
          ),
          Offstage(
            offstage: _tabIndex != 1,
            child: ProgressMenu(),
          ),
        ],
      ),
    );
  }
}
