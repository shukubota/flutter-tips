import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Repository {
  List<Todo> fetchTodoList() {
    return [];
  }
}

final repositoryProvider = Provider((ref) => Repository());
final todoListProvider = Provider((ref) {
  final repository = ref.read(repositoryProvider);
  return repository.fetchTodoList();
});

class FakeRepository implements Repository {
  @override
  List<Todo> fetchTodoList() {
    return [Todo(status: TodoStatus.UNDONE, title: 'todo1')];
  }
}

class TodoItem extends HookWidget {
  const TodoItem({Key key, this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Text(todo.title);
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryProvider
              .overrideWithProvider(Provider((ref) => FakeRepository())),
        ],
        // child: FlutterTips(),
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(builder: (context, watch, _) {
              final todos = watch(todoListProvider);
              print(todos);

              if (todos == null) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: [
                  for (final todo in todos) TodoItem(todo: todo),
                ],
              );
            }),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);
    await tester.pump();
    expect(tester.widgetList(find.byType(TodoItem)), [
      isA<TodoItem>()
          .having((s) => s.todo.title, 'todo.title', 'todo1')
          .having((s) => s.todo.status, 'todo.status', TodoStatus.UNDONE),
    ]);
  });
}
