import 'package:flutter/cupertino.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('注册'),
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
