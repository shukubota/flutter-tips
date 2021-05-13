import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterComponent extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final count = useProvider(countProvider.state);
    final countViewModel = useProvider(countProvider);
    void onPressed() {
      context.read(countProvider).plus();
    }

    return Container(
      child: Row(
        children: [
          Container(
            child: Text('counter: $count'),
          ),
          Padding(padding: EdgeInsets.only(right: 20)),
          ElevatedButton(onPressed: onPressed, child: Text('たす')),
        ],
      ),
    );
  }
}
