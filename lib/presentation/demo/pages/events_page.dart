import 'package:flutter/cupertino.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('事件'),
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
