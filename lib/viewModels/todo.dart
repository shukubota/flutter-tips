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

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(
      _todoList.where((item) => item.status == TodoStatus.UNDONE));
  UnmodifiableListView<Todo> get completedTodoList => UnmodifiableListView(
      _todoList.where((item) => item.status == TodoStatus.DONE));

  void registerTodo(String title) {
    print(title);
    final ids = _todoList.map((item) => item.id).toList();
    final newId = ids.length > 0 ? ids.reduce(max) + 1 : 1;
    _todoList = [
      ..._todoList,
      Todo(id: newId, title: title, status: TodoStatus.UNDONE)
    ];
    notifyListeners();
  }

  void deleteTodo(int todoId) {
    _todoList = _todoList.where((item) => item.id != todoId).toList();
    notifyListeners();
  }

  void completeTodo(int todoId) {
    _todoList = [
      for (final todo in _todoList)
        if (todo.id == todoId)
          Todo(id: todoId, title: todo.title, status: TodoStatus.DONE)
        else
          todo
    ];
    notifyListeners();
  }
}
