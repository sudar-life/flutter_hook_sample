import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedPage extends HookWidget {
  UseMemoizedPage({super.key});

  int value = 0;

  @override
  Widget build(BuildContext context) {
    final counter = useMemoized(() {
      return value;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('useState'),
      ),
      body: Center(
          child: Text(
        counter.toString(),
        style: const TextStyle(fontSize: 80),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
