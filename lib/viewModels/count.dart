import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class CountState {
  CountState({
    this.value = 0,
  });
  final int value;
}

class CountController extends StateNotifier<CountState> {
  CountController() : super(CountState());

  void plus() async {
    // await sleep();
    state = CountState(value: state.value + 1);
  }

  void minus() {
    state = CountState(value: state.value - 1);
  }
}

Future<void> sleep() async {
  await new Future.delayed(const Duration(seconds: 3));
}
