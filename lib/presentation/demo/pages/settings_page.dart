import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('设置'),
      // ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            // 你的点击逻辑
          },
          child: const Text('按钮'),
        ),
      ),
    );
  }
}
