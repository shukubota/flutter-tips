import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tips/state/state.dart';
import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoRegisterFormController = TextEditingController();

class TodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // final undoneTodoList = useProvider(undoneTodoListProvider);
    final todoList = useProvider(todoListProvider);
    final undoneTodoList = todoList.state;
    print(todoList);
    print('undoneTodolist');
    // print(undoneTodoList);
    void onSubmitted(value) {
      if (value == '') return;
      context.read(todoListProvider).registerTodo(value);
      todoRegisterFormController.clear();
    }

    return Column(
      children: [
        TextField(
          controller: todoRegisterFormController,
          onSubmitted: onSubmitted,
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final todo in undoneTodoList) TodoItem(todo: todo),
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
    // final todoViewModel = useProvider(todoListProvider);
    print(todo.title);
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ListTile(
          title: Text(todo.title, style: TextStyle(fontSize: 24)),
        ),
        actions: todo.status == TodoStatus.UNDONE
            ? [
                IconSlideAction(
                  caption: 'おわった',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () =>
                      context.read(todoListProvider).completeTodo(todo.id),
                )
              ]
            : null,
        secondaryActions: [
          IconSlideAction(
            caption: 'けす',
            color: Colors.grey,
            icon: Icons.delete,
            // onTap: () =>
            //     todoViewModel.todoList[0] = Todo(id: 100, title: 'titleeeee'),
            onTap: () => context.read(todoListProvider).deleteTodo(todo.id),
          )
        ],
      ),
    );
  }
}
