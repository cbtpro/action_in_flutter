import 'package:action_in_flutter/presentation/demo/pages/index_page.dart';
import 'package:action_in_flutter/views/feedbacks/index.dart';
import 'package:action_in_flutter/views/invites/index.dart';
import 'package:action_in_flutter/views/points/index.dart';
import 'package:action_in_flutter/views/settings/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // 首页路由
  static const String home = '/';
  static const String points = '/points';
  static const String settings = '/settings';
  static const String feedback = '/feedback';
  static const String invites = '/invites';

  /// Material 404 页面
  static Widget materialNotFoundPage(String routeName) {
    return Scaffold(
      appBar: AppBar(title: const Text("页面未找到")),
      body: Center(child: Text("404 - Page not found\n$routeName")),
    );
  }

  /// ---------------------------
  /// Cupertino 路由
  /// ---------------------------
  static final Map<String, WidgetBuilder> routers = {
    home: (context) => const IndexPage(),
    points: (context) => const PointsPage(),
    invites: (context) => const InvitePage(),
    settings: (context) => const SettingsPage(),
    feedback: (context) => const FeedbackPage(),
    // 其他 Cupertino 路由可以在这里增加
  };

  /// Cupertino onGenerateRoute
  static Route<dynamic> onGenerateCupertinoRoute(RouteSettings settings) {
    final builder = routers[settings.name];
    if (builder != null) {
      return CupertinoPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    // Cupertino 404 页面
    return CupertinoPageRoute(
      builder: (_) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("页面未找到"),
        ),
        child: Center(
          child: Text("404 - Page not found\n${settings.name}"),
        ),
      ),
      settings: settings,
    );
  }
}
