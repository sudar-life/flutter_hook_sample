import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_effect.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_memoized.dart';
import 'package:flutter_hooks_sample_app/src/pages/use_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget title(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        '---------- $message ----------',
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hook Sample'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title('Existing hooks'),
              ElevatedButton(
                onPressed: () {
                  pushPage(context, const UseStatePage());
                },
                child: const Text('useState'),
              ),
              ElevatedButton(
                onPressed: () {
                  pushPage(context, UseEffectPage());
                },
                child: const Text('useEffect'),
              ),
              ElevatedButton(
                onPressed: () {
                  pushPage(context, UseMemoizedPage());
                },
                child: const Text('useMemoized'),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('useRef')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('useCallback')),
              ElevatedButton(onPressed: () {}, child: const Text('useContext')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('useVAlueChanged')),
            ],
          ),
        ),
      ),
    );
  }
}
