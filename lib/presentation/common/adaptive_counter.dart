import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveCounter extends StatefulWidget {
  const AdaptiveCounter({super.key});

  @override
  State<AdaptiveCounter> createState() => _AdaptiveCounterState();
}

class _AdaptiveCounterState extends State<AdaptiveCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool get isCupertino {
  // 仅 iOS / macOS（非 Web）用 Cupertino 风格
  return !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
       defaultTargetPlatform == TargetPlatform.macOS);
  }

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      final cupertinoTheme = CupertinoTheme.of(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你点击了多少次按钮：'),
          Text(
            '$_counter',
            style: cupertinoTheme.textTheme.navLargeTitleTextStyle,
          ),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            onPressed: _incrementCounter,
            child: const Icon(CupertinoIcons.add),
          ),
        ],
      );
    } else {
      final theme = Theme.of(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你点击了多少次按钮：'),
          Text('$_counter', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      );
    }
  }
}
