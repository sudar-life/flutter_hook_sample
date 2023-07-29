import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStreamPage extends HookWidget {
  Stream<int> countStream() {
    return Stream<int>.periodic(const Duration(seconds: 1), (i) => i + 1);
  }

  @override
  Widget build(BuildContext context) {
    var stream = useMemoized(() => countStream());
    var snapshot = useStream<int>(stream);
    return Scaffold(
      appBar: AppBar(
        title: const Text('useStream'),
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
