import 'package:flutter_tips/viewModels/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = ChangeNotifierProvider((ref) => TodoViewModel());
