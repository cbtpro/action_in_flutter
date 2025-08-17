import 'package:action_in_flutter/presentation/common/adaptive-counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_in_flutter/utils/device/platform_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

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
