import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('积分')),
        child: SafeArea(child: Center(child: Text("积分页面内容"))),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('积分')),
        body: const Center(child: Text("积分页面内容")),
      );
    }
  }
}
