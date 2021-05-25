import 'dart:math';
import 'package:flutter/cupertino.dart';
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

@immutable
class TodoListState {
  TodoListState({
    this.todoList,
  });
  final List<Todo> todoList;
  List<Todo> get undoneList {
    return todoList.where((item) => item.status == TodoStatus.UNDONE).toList();
  }

  List<Todo> get doneList {
    return todoList.where((item) => item.status == TodoStatus.DONE).toList();
  }
}

class TodoController extends StateNotifier<TodoListState> {
  TodoController() : super(TodoListState(todoList: []));

  void registerTodo(String title) {
    final ids = state.todoList.map((item) => item.id).toList();
    final newId = ids.length > 0 ? ids.reduce(max) + 1 : 1;
    final newTodoList = [
      ...state.todoList,
      Todo(id: newId, title: title, status: TodoStatus.UNDONE),
    ];
    state = TodoListState(todoList: newTodoList);
  }

  void deleteTodo(int todoId) {
    final newTodoList =
        state.todoList.where((item) => item.id != todoId).toList();
    state = TodoListState(todoList: newTodoList);
  }

  void completeTodo(int todoId) {
    final newTodoList = [
      for (final todo in state.todoList)
        if (todo.id == todoId)
          Todo(id: todoId, title: todo.title, status: TodoStatus.DONE)
        else
          todo
    ];
    state = TodoListState(todoList: newTodoList);
  }
}
