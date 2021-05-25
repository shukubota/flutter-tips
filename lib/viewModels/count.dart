import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class CountState {
  CountState({
    this.value = 0,
    this.value2 = 0,
  });
  final int value;
  final int value2;
}

class CountController extends StateNotifier<CountState> {
  CountController() : super(CountState());

  void plus() async {
    // await sleep();
    state = CountState(value: state.value + 1, value2: state.value2);
  }

  void minus() {
    state = CountState(value: state.value - 1, value2: state.value2);
  }

  void plus2() async {
    state = CountState(value: state.value, value2: state.value2 + 1);
  }
}

Future<void> sleep() async {
  await new Future.delayed(const Duration(seconds: 1));
}
