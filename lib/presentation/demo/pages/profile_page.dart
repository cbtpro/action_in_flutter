import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('我的')),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              _Header(),
              _CupertinoCell(
                icon: CupertinoIcons.star,
                title: "我的积分",
                onTap: () => {
                  logger.i('点击了我的积分'),
                  // Navigator.push(...);
                },
              ),
              _CupertinoCell(
                icon: CupertinoIcons.person_add,
                title: "邀请好友",
                onTap: () => {
                  logger.i('点击邀请好友'),
                  // Navigator.push(...);
                },
              ),
              _CupertinoCell(
                icon: CupertinoIcons.chat_bubble_text,
                title: "投诉建议",
                onTap: () => {
                  logger.i('点击了投诉建议'),
                  // Navigator.push(...);
                },
              ),
              _CupertinoCell(
                icon: CupertinoIcons.settings,
                title: "设置",
                trailingIcon: CupertinoIcons.right_chevron,
                onTap: () => {
                  logger.i('点击了设置'),
                  // Navigator.push(...);
                },
              ),
              const _SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.systemOrange.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              "http://b-ssl.duitang.com/uploads/item/201903/12/20190312172823_sioam.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "大反派",
            style: TextStyle(fontSize: 18, color: CupertinoColors.label),
          ),
        ],
      ),
    );
  }
}

class _CupertinoCell extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const _CupertinoCell({
    required this.icon,
    required this.title,
    this.trailingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      color: CupertinoColors.white,
      pressedOpacity: 0.6, // 设置点击时的透明度变化
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: CupertinoColors.systemGrey4, width: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: CupertinoColors.systemBlue),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16, color: CupertinoColors.black))),
            if (trailingIcon != null)
              Icon(trailingIcon, color: CupertinoColors.systemGrey2, size: 18),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CupertinoButton(
        color: CupertinoColors.systemRed,
        padding: const EdgeInsets.symmetric(vertical: 14),
        onPressed: () {
          // TODO: 实现退出逻辑
          logger.i('点击了退出');
        },
        child: const Text(
          "退出登录",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}
