import 'package:action_in_flutter/utils/device/platform_utils.dart';
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
    if (PlatformUtils.isCupertino) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('你点击了多少次按钮：'),
          Text(
            '$_counter',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            onPressed: _incrementCounter,
            child: const Icon(CupertinoIcons.add),
          ),
        ],
      );
    } else {
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
