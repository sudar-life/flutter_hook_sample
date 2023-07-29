import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseFuturePage extends HookWidget {
  Future<int> futureEvent() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    var future = useMemoized(() => futureEvent());
    var snapshot = useFuture<int>(future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('useFuture'),
      ),
      body: Center(
        child: snapshot.hasError
            ? ErrorWidget(snapshot.error!)
            : snapshot.hasData
                ? Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 80),
                  )
                : const CircularProgressIndicator(),
      ),
    );
  }
}
