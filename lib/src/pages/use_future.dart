import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseFuturePage extends HookWidget {
  Future<int> futureEvent() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    var count = useState(0);
    var snapshot = useFuture(futureEvent(), initialData: 5);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('useFuture'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(count.value.toString()),
            snapshot.hasError
                ? ErrorWidget(snapshot.error!)
                : snapshot.hasData
                    ? Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 80),
                      )
                    : const CircularProgressIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        count.value++;
      }),
    );
  }
}
