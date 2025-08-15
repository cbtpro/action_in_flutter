import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
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
    const title = '首页';

    // iOS 或 macOS 用 Cupertino 风格
    if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final brightness = MediaQuery.platformBrightnessOf(context);
          return CupertinoTheme(
            data: CupertinoThemeData(
              brightness: brightness,
              textTheme: const CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'NotoSans'),
              ),
            ),
            child: child!,
          );
        },
        home: const MyHomePage(title: title),
      );
    }
    // Android / Windows / Web 用 Material 风格
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemeData.lightThemeData,
        darkTheme: AppThemeData.darkThemeData,
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: title),
      );
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Cupertino 平台
    if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
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
    }
    // Material 平台（Android / Windows / Web / 其他）
    else {
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
