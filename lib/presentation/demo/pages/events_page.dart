import 'package:action_in_flutter/constants/colors/usage_example.dart';
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
        child: const ColorUsageExample(),
      ),
    );
  }
}
