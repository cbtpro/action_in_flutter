import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('设置')),
        child: SafeArea(child: Center(child: Text("设置页面内容"))),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('设置')),
        body: const Center(child: Text("设置页面内容")),
      );
    }
  }
}
