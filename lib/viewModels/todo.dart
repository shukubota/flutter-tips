import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';

enum TodoStatus {
  UNDONE,
  DOING,
  DONE,
}

extension TodoStatusExtension on TodoStatus {
  static final todoNames = {
    TodoStatus.UNDONE: '未完了',
    TodoStatus.DOING: '着手中',
    TodoStatus.DONE: '完了',
  };
  String get todoName => todoNames[this];
}

class Todo {
  int id;
  String title;
  TodoStatus status;
  Todo({id, title, status}) {
    this.status = status ?? TodoStatus.UNDONE;
    this.title = title ?? '';
    this.id = id;
  }
}

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todoList = [];

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(_todoList);

  void registerTodo(String title) {
    final ids = _todoList.map((item) => item.id).toList();
    final newId = ids.length > 0 ? ids.reduce(max) + 1 : 1;
    _todoList = [
      ..._todoList,
      Todo(id: newId, title: title, status: TodoStatus.UNDONE)
    ];
    notifyListeners();
  }
}
