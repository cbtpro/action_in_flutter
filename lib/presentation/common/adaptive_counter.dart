import 'dart:io' show Platform;
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

  @override
  Widget build(BuildContext context) {
    // 根据平台选择不同风格
    if (Platform.isIOS) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你点击了多少次按钮：'),
          Text('$_counter', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            child: const Icon(CupertinoIcons.add),
            onPressed: _incrementCounter,
          ),
        ],
      );
    } else {
      // 默认 Material
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你点击了多少次按钮：'),
          Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
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
