// Flutter: Existing Libraries
import 'dart:developer';

import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers
import '../controllers/provider.dart';

// HomePage: ConsumerWidget Class
class HomePage extends ConsumerWidget {
  // Static & Constant: Class Properties
  static const String title = "Home";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // returning widgets
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Riverpod Simplified Example"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ref.watch(userProvider).when(
                      data: (String value) => value,
                      error: (Object error, StackTrace? stackTrace) {
                        return error.toString();
                      },
                      loading: () => "Loading",
                    ),
              ),
              const SizedBox(height: 100.0),
              Text(
                ref.watch(userProvider).maybeWhen(
                      data: (String value) => value,
                      orElse: () => "Loading",
                    ),
              ),
              const SizedBox(height: 100.0),
              Text(ref.watch(counterController).toString()),
              const SizedBox(height: 100.0),
              Text(
                ref.watch(counterAsyncController).maybeWhen(
                      data: (int value) => value.toString(),
                      orElse: () => "Loading",
                    ),
              ),
              const SizedBox(height: 100.0),
              ElevatedButton(
                onPressed: () {
                  final CounterNotifier counterNotifier =
                      ref.watch(counterController.notifier);
                  counterNotifier.add();

                  final CounterAsyncNotifier counterAsyncNotifier =
                      ref.watch(counterAsyncController.notifier);
                  counterAsyncNotifier.add();
                },
                child: const Text("Add"),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final CounterNotifier counterNotifier =
                      ref.watch(counterController.notifier);
                  counterNotifier.subtract();

                  final CounterAsyncNotifier counterAsyncNotifier =
                      ref.watch(counterAsyncController.notifier);
                  counterAsyncNotifier.subtract();
                },
                child: const Text("Subtract"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
