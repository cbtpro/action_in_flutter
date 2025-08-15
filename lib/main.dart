import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_in_flutter/presentation/common/adaptive_counter.dart';
import 'package:action_in_flutter/constants/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        // 用 builder 注入一个会随系统变化的 CupertinoTheme
        builder: (context, child) {
          final brightness = MediaQuery.platformBrightnessOf(context);
          return CupertinoTheme(
            data: CupertinoThemeData(
              // 跟随系统 Light/Dark
              brightness: brightness,
              textTheme: const CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'NotoSans'),
              ),
            ),
            child: child!,
          );
        },
        home: const MyHomePage(title: '首页'),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemeData.lightThemeData,
        darkTheme: AppThemeData.darkThemeData,
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: '首页'),
      );
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      final cupertinoTheme = CupertinoTheme.of(context);
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // 不手动上色，让它用主题/系统自动对比色
          middle: Text(
            title,
            // 如需自定义，可用主题里的标题样式（会随亮暗变）
            style: cupertinoTheme.textTheme.navTitleTextStyle,
          ),
          // 背景也用主题提供的 bar 背景，更自然
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
              color: theme.colorScheme.onSurface, // 标题文字颜色
            ),
          ),
          backgroundColor: theme.colorScheme.surface, // 背景色
          iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          elevation: 0,
        ),
        body: const Center(child: AdaptiveCounter()),
      );
    }
  }
}
