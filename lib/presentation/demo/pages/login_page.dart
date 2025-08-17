import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('登录'),
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
