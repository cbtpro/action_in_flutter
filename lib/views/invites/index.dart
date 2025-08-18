import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvitePage extends StatelessWidget {
  const InvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('邀请好友')),
        child: SafeArea(child: Center(child: Text("邀请好友页面内容"))),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('邀请好友')),
        body: const Center(child: Text("邀请好友页面内容")),
      );
    }
  }
}
