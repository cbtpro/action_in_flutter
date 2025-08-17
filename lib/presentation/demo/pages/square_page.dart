import 'package:action_in_flutter/constants/colors/colors_useage_widget.dart';
import 'package:action_in_flutter/constants/colors/flutter_component_demo.dart';
import 'package:flutter/cupertino.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('首页'),
      // ),
      child: Center(
        // child: ColorUsageWidget(),
        child: FlutterComponentsDemo(),
      )
    );
  }
}
