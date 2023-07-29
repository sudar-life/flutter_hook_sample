import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedPage extends HookWidget {
  UseMemoizedPage({super.key});

  int value = 0;
  String searchKey = '0';
  Future<int> getNumber({String? searchOption}) async {
    await Future.delayed(Duration(milliseconds: 2000));
    return int.parse(searchOption ?? '0'); //Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    var count = useState(value);
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('useState'),
      ),
      body: FutureBuilder(
        future:
            useMemoized(() => getNumber(searchOption: searchKey), [searchKey]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(
              child: Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 80),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        count.value++;
        if (count.value % 5 == 0) {
          searchKey = count.value.toString();
        }
      }),
    );
  }
}
