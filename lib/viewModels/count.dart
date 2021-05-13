import 'dart:collection';
import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountViewModel extends StateNotifier<int> {
  CountViewModel() : super(0);

  // UnmodifiableListView<Todo> get todoList => UnmodifiableListView(
  //     state.where((item) => item.status == TodoStatus.UNDONE));
  // UnmodifiableListView<Todo> get completedTodoList => UnmodifiableListView(
  //     state.where((item) => item.status == TodoStatus.DONE));

  void plus() {
    state++;
    print(state);
  }

  void minus() {
    state = state - 1;
  }
}
