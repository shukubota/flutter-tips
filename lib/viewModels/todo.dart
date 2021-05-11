import 'dart:collection';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class TodoViewModel extends StateNotifier<List<Todo>> {
  TodoViewModel() : super([]);
  // List<Todo> _todoList = [];

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(
      state.where((item) => item.status == TodoStatus.UNDONE));
  UnmodifiableListView<Todo> get completedTodoList => UnmodifiableListView(
      state.where((item) => item.status == TodoStatus.DONE));

  void registerTodo(String title) {
    print(title);
    print(state.map((item) => item.id).toList().length);
    final ids = state.map((item) => item.id).toList();
    print(ids);
    final newId = ids.length > 0 ? ids.reduce(max) + 1 : 1;
    print(newId);
    state = [
      ...state,
      Todo(id: newId, title: title, status: TodoStatus.UNDONE)
    ];
    print(state);
    // notifyListeners();
  }

  void deleteTodo(int todoId) {
    state = state.where((item) => item.id != todoId).toList();
    // notifyListeners();
  }

  void completeTodo(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          Todo(id: todoId, title: todo.title, status: TodoStatus.DONE)
        else
          todo
    ];
    // notifyListeners();
  }
}
