import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'TodoList.dart';

final todoRegisterFormController = TextEditingController();

class DoneTodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final doneTodoList =
        useProvider(todoListProvider.state.select((state) => state.doneList));

    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final todo in doneTodoList) TodoItem(todo: todo),
            ],
          ),
        ),
      ],
    );
  }
}
