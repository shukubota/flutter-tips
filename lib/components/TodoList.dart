import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/all.dart';

class TodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final todoViewModel = useProvider(todoListProvider);
    print(todoViewModel.todoList);
    void onSubmitted(value) {
      print(value);
      print(todoViewModel);
      todoViewModel.registerTodo(value);
    }

    return Column(
      children: [
        TextField(
          // onChanged: (e) => print(e),
          onSubmitted: onSubmitted,
        ),
        Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final todo in todoViewModel.todoList) TodoItem(todo: todo),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        // Consumer(
        //   builder: (context, watch, child) {
        //     final todos = watch(todoListProvider);
        //     return Container(
        //       child: ListView(
        //         shrinkWrap: true,
        //         children: [
        //           for (final todo in todos) TodoItem(todo: todo),
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}

class TodoItem extends HookWidget {
  TodoItem({Key key, this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text(todo.title),
      ],
    ));
  }
}
