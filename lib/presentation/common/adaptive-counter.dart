import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 一个自适应风格的计数器
///
/// 在 iOS/macOS 上显示 Cupertino 风格的按钮和文本
/// 在 Android/Web/Linux/Windows 上显示 Material 风格的按钮和文本
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
    final bool cupertino = PlatformUtils.isCupertino;

    // 文本样式根据平台选择
    final TextStyle counterStyle = cupertino
        ? CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle
        : Theme.of(context).textTheme.headlineMedium!;

    // 按钮 Widget，根据平台切换 CupertinoButton 或 FloatingActionButton
    final Widget button = cupertino
        ? CupertinoButton.filled(
            onPressed: _incrementCounter,
            child: const Icon(CupertinoIcons.add),
          )
        : FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );

    // Column 布局统一处理
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('你点击了多少次按钮：'),
        Text('$_counter', style: counterStyle),
        const SizedBox(height: 16),
        button,
      ],
    );
  }
}
