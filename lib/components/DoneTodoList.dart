import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'TodoList.dart';

final todoRegisterFormController = TextEditingController();

class DoneTodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final undoneTodoList = useProvider(undoneTodoListProvider);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final todo in undoneTodoList) TodoItem(todo: todo),
            ],
          ),
        ),
      ],
    );
  }
}
