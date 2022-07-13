// Flutter: Existing Libraries
import 'dart:developer';

import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// Data
import '../data/database.dart';

// User State For The App
final userProvider = FutureProvider<String>((ref) async {
  return ref.read(databaseProvider).getUserData();
});

// Counter State Notifier For The App
final counterController =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  // Constructor
  CounterNotifier() : super(0);

  // Action: Class Methods
  void add() {
    state++;
  }

  void subtract() {
    state--;
  }
}

// Counter Async State Notifier For The App
final counterAsyncController =
    StateNotifierProvider<CounterAsyncNotifier, AsyncValue<int>>(
        (ref) => CounterAsyncNotifier(ref.read));

class CounterAsyncNotifier extends StateNotifier<AsyncValue<int>> {
  // Final: Class Properties
  final Reader read;

  // Constructor
  CounterAsyncNotifier(this.read) : super(const AsyncLoading()) {
    init();
  }

  // Initialize Data
  void init() async {
    await read(databaseProvider).initDatabase();
    state = const AsyncData(0);
  }

  // Action: Class Methods
  void add() async {
    state = const AsyncLoading();
    int count = await read(databaseProvider).increment();
    state = AsyncData(count);
  }

  void subtract() async {
    state = const AsyncLoading();
    int count = await read(databaseProvider).decrement();
    state = AsyncData(count);
  }
}
