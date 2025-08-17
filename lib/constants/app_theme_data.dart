import 'package:flutter/material.dart';

/// 自定义 AppThemeData
class AppThemeData {
  // 亮/暗模式的焦点色（透明度 12%）
  static final Color _lightFocusColor = lightColorScheme.onSurface;
  static final Color _darkFocusColor = darkColorScheme.onSurface;

  /// 统一配置 icon 尺寸
  static const double _iconSize = 22;

  /// 主题实例
  static final ThemeData lightThemeData = _themeData(lightColorScheme, _lightFocusColor, _iconSize);
  static final ThemeData darkThemeData = _themeData(darkColorScheme, _darkFocusColor, _iconSize);

  /// 构建主题
  static ThemeData _themeData(ColorScheme colorScheme, Color focusColor, double iconSize) {
    final textTheme = _textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface);

    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'NotoSans',
      textTheme: textTheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: iconSize),
        titleTextStyle: textTheme.headlineMedium,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary, size: iconSize),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
        selectedIconTheme: IconThemeData(size: iconSize),
        unselectedIconTheme: IconThemeData(size: iconSize),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.surface,
        contentTextStyle: textTheme.bodyMedium,
      ),
    );
  }

  // 亮色方案（柔和版）
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB22222),           // 深红色
    primaryContainer: Color(0xFFFADADA),  // 浅红色
    secondary: Color(0xFFE0E5E5),         // 浅灰蓝色
    secondaryContainer: Color(0xFFF5F7F7),// 浅灰色背景
    surface: Color(0xFFFFFFFF),      
    error: Color(0xFFB00020),
    onError: Color(0xFF222222),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF2C2C2C),
    onSurface: Color(0xFF222222),
    brightness: Brightness.light,
  );

  // 暗色方案（柔和舒适版）
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF6F6F),           // 柔和粉红
    primaryContainer: Color(0xFF2A4D4D),  // 暗绿色调
    secondary: Color(0xFF6A4C9B),         // 暗紫色
    secondaryContainer: Color(0xFF563B82),
    surface: Color(0xFF1E1E28),           // 深灰蓝
    error: Color(0xFFCF6679),             // 柔和红
    onError: Color(0xFFE0E0E0),
    onPrimary: Color(0xFF1E1E28),
    onSecondary: Color(0xFFE0E0E0),
    onSurface: Color(0xFFE0E0E0),
    brightness: Brightness.dark,
  );

  // 字重定义
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  // 文字主题
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: const TextStyle(fontFamily: 'NotoSans', fontWeight: _bold, fontSize: 20.0),
    bodySmall: const TextStyle(fontFamily: 'NotoSans', fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: const TextStyle(fontFamily: 'NotoSans', fontWeight: _medium, fontSize: 16.0),
    titleMedium: const TextStyle(fontFamily: 'NotoSans', fontWeight: _medium, fontSize: 16.0),
    labelSmall: const TextStyle(fontFamily: 'NotoSans', fontWeight: _medium, fontSize: 12.0),
    bodyLarge: const TextStyle(fontFamily: 'NotoSans', fontWeight: _regular, fontSize: 14.0),
    titleSmall: const TextStyle(fontFamily: 'NotoSans', fontWeight: _medium, fontSize: 14.0),
    bodyMedium: const TextStyle(fontFamily: 'NotoSans', fontWeight: _regular, fontSize: 16.0),
    titleLarge: const TextStyle(fontFamily: 'NotoSans', fontWeight: _bold, fontSize: 16.0),
    labelLarge: const TextStyle(fontFamily: 'NotoSans', fontWeight: _semiBold, fontSize: 14.0),
  );
}
