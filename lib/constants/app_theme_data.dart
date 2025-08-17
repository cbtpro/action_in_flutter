import 'package:flutter/material.dart';

/// 自定义 AppThemeData （完全基于 ColorScheme）
class AppThemeData {
  static final Color _lightFocusColor = lightColorScheme.onSurface;
  static final Color _darkFocusColor = darkColorScheme.onSurface;

  /// 统一配置 icon 尺寸
  static const double _iconSize = 22;

  /// 亮色主题
  static final ThemeData lightThemeData = _themeData(
    lightColorScheme,
    _lightFocusColor,
    _iconSize,
  );

  /// 暗色主题
  static final ThemeData darkThemeData = _themeData(
    darkColorScheme,
    _darkFocusColor,
    _iconSize,
  );

  /// 构建主题（核心方法）
  static ThemeData _themeData(
    ColorScheme colorScheme,
    Color focusColor,
    double iconSize,
  ) {
    final textTheme = _textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: 'NotoSans',
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,

      /// AppBar 样式
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: iconSize,
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),

      /// 默认图标主题
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
        size: iconSize,
      ),

      /// 底部导航栏样式
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        selectedIconTheme: IconThemeData(size: iconSize, color: colorScheme.primary),
        unselectedIconTheme: IconThemeData(size: iconSize, color: colorScheme.onSurfaceVariant),
      ),

      /// SnackBar 样式
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.surface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  // ============ 亮色方案 ============
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // 主色
    primary: Color(0xFFFFA502),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFFFADADA),
    onPrimaryContainer: Color(0xFF222222),

    // 次色
    secondary: Color(0xFFECCC68),
    onSecondary: Color(0xFF2C2C2C),
    secondaryContainer: Color(0xFF7BED9F),
    onSecondaryContainer: Color(0xFFFFFFFF),

    // 第三色
    tertiary: Color(0xFF9C27B0),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF2ED573),
    onTertiaryContainer: Color(0xFFFFFFFF),

    // 背景
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF222222),

    // 错误
    error: Color(0xFFFF4757),
    onError: Color(0xFFFFFFFF),

    // 边框/阴影
    outline: Color(0xFF888888),
    shadow: Color(0xFF000000),

    // 反转
    inverseSurface: Color(0xFF222222),
    inversePrimary: Color(0xFFFF6F6F),

    // 高级容器
    surfaceContainerHighest: Color(0xFFF5F7F7),
    onSurfaceVariant: Color(0xFF444444),
  );

  // ============ 暗色方案 ============
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFFFFA502),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF131312),
    onPrimaryContainer: Color(0xFFFFFFFF),

    secondary: Color(0xFFEFEFEF),
    onSecondary: Color(0xFFE0E0E0),
    secondaryContainer: Color(0xFFE0E0E0),
    onSecondaryContainer: Color(0xFF222222),

    tertiary: Color(0xFF6A4C9B),
    onTertiary: Color(0xFFE0E0E0),
    tertiaryContainer: Color(0xFF4A2C6B),
    onTertiaryContainer: Color(0xFFE0E0E0),

    surface: Color(0xFF1E1E28),
    onSurface: Color(0xFFE0E0E0),

    error: Color(0xFFCF6679),
    onError: Color(0xFF1E1E28),

    outline: Color(0xFF888888),
    shadow: Color(0xFF000000),

    inverseSurface: Color(0xFFE0E0E0),
    inversePrimary: Color(0xFFFFB733),

    surfaceContainerHighest: Color(0xFF2A2A3A),
    onSurfaceVariant: Color(0xFFE0E0E0),
  );

  // ============ 字重 ============
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  // ============ 字体主题 ============
  static final TextTheme _textTheme = TextTheme(
    headlineMedium: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _bold,
      fontSize: 20.0,
    ),
    bodySmall: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _semiBold,
      fontSize: 16.0,
    ),
    headlineSmall: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _medium,
      fontSize: 16.0,
    ),
    titleMedium: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _medium,
      fontSize: 16.0,
    ),
    labelSmall: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _medium,
      fontSize: 12.0,
    ),
    bodyLarge: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _regular,
      fontSize: 14.0,
    ),
    titleSmall: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _medium,
      fontSize: 14.0,
    ),
    bodyMedium: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _regular,
      fontSize: 16.0,
    ),
    titleLarge: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _bold,
      fontSize: 16.0,
    ),
    labelLarge: const TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: _semiBold,
      fontSize: 14.0,
    ),
  );
}
