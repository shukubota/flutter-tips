import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/components/DoneTodoList.dart';

class ProgressMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('おわったりすと')),
      body: Container(
        child: DoneTodoList(),
      ),
    );
  }
}
