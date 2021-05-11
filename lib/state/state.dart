import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = StateNotifierProvider((ref) => TodoViewModel());

// final undoneTodoListProvider = Provider((ref) => TodoViewModel().todoList);

// final doneTodoListProvider =
//     Provider((ref) => TodoViewModel().completedTodoList);
