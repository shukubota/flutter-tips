import 'package:flutter_tips/viewModels/count.dart';
import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = StateNotifierProvider((ref) => TodoController());

final countProvider = StateNotifierProvider((ref) => CountController());
