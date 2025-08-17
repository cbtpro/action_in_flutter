import 'package:action_in_flutter/presentation/demo/pages/index_page.dart';
import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_in_flutter/presentation/common/adaptive-counter.dart';
import 'package:action_in_flutter/constants/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      return CupertinoApp(
      title: "生而不庸",
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: IndexPage(),
    );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemeData.lightThemeData,
        darkTheme: AppThemeData.darkThemeData,
        themeMode: ThemeMode.system,
        home: IndexPage(),
      );
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      final cupertinoTheme = CupertinoTheme.of(context);
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            title,
            style: cupertinoTheme.textTheme.navTitleTextStyle,
          ),
          backgroundColor: cupertinoTheme.barBackgroundColor,
        ),
        child: const SafeArea(child: Center(child: AdaptiveCounter())),
      );
    } else {
      final theme = Theme.of(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          backgroundColor: theme.colorScheme.surface,
          iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          elevation: 0,
        ),
        body: const Center(child: AdaptiveCounter()),
      );
    }
  }
}
