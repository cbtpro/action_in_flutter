import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:action_in_flutter/presentation/demo/pages/home_page.dart';
import 'square_page.dart';
import 'events_page.dart';
import 'profile_page.dart';

/// 底部导航 Tabs
/// - iOS / macOS 使用 CupertinoTabScaffold
/// - 其他平台使用 Material 的 Scaffold + BottomNavigationBar
class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late CupertinoTabController _cupertinoTabController;
  int _materialTabIndex = 0;

  // 页面列表
  final List<Widget> _pages = const [
    HomePage(title: '首页'),
    SquarePage(),
    EventsPage(),
    ProfilePage(),
  ];

  // Tab 配置
  final List<_TabItem> _tabItems = const [
    _TabItem(label: '首页', cupertinoIcon: CupertinoIcons.home, materialIcon: Icons.home),
    _TabItem(label: '广场', cupertinoIcon: CupertinoIcons.square_list, materialIcon: Icons.explore),
    _TabItem(label: '事件', cupertinoIcon: CupertinoIcons.info, materialIcon: Icons.event),
    _TabItem(label: '我的', cupertinoIcon: CupertinoIcons.person, materialIcon: Icons.person),
  ];

  @override
  void initState() {
    super.initState();
    _cupertinoTabController = CupertinoTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _cupertinoTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isCupertino
        ? _buildCupertinoTabs(context)
        : _buildMaterialTabs(context);
  }

  Widget _buildCupertinoTabs(BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoTabScaffold(
      controller: _cupertinoTabController,
      tabBar: CupertinoTabBar(
        backgroundColor: theme.colorScheme.surface,
        items: _tabItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.cupertinoIcon, size: theme.iconTheme.size, color: theme.colorScheme.onTertiary),
                  label: item.label,
                ))
            .toList(),
      ),
      tabBuilder: (context, index) => _pages[index],
    );
  }

  Widget _buildMaterialTabs(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _pages[_materialTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _materialTabIndex,
        onTap: (index) => setState(() => _materialTabIndex = index),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurfaceVariant,
        selectedIconTheme: theme.iconTheme,
        unselectedIconTheme: theme.iconTheme,
        items: _tabItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.materialIcon, size: theme.iconTheme.size),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }
}

/// Tab 配置对象
class _TabItem {
  final String label;
  final IconData cupertinoIcon;
  final IconData materialIcon;

  const _TabItem({
    required this.label,
    required this.cupertinoIcon,
    required this.materialIcon,
  });
}
