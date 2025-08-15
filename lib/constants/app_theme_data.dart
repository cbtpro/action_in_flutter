// 自定义的 AppThemeData
import 'package:flutter/material.dart';

class AppThemeData {
  // 基础文字颜色
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  // 亮/暗模式的焦点色（透明度 12%）
  static final Color _lightFocusColor = lightColorScheme.onSurface.withAlpha(31);
  static final Color _darkFocusColor = darkColorScheme.onSurface.withAlpha(31);

  // 主题实例
  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  // 构建主题
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'NotoSans',
      textTheme: _textTheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        titleTextStyle: _textTheme.headlineMedium!.copyWith(color: colorScheme.onSurface),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withAlpha(204), // 原 opacity 0.8 -> 204/255
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  // 亮色方案（柔和版）
static const ColorScheme lightColorScheme = ColorScheme(
  primary: Color(0xFFB22222),           // 深红色，稍柔和
  primaryContainer: Color(0xFFFADADA),  // 浅红色
  secondary: Color(0xFFE0E5E5),         // 浅灰蓝色
  secondaryContainer: Color(0xFFF5F7F7),// 浅灰色背景
  surface: Color(0xFFFFFFFF),           // 白色，避免过亮的灰
  error: Color(0xFFB00020),
  onError: _lightFillColor,
  onPrimary: _lightFillColor,
  onSecondary: Color(0xFF2C2C2C),
  onSurface: Color(0xFF222222),
  brightness: Brightness.light,
);

// 暗色方案（柔和舒适版）
static const ColorScheme darkColorScheme = ColorScheme(
  primary: Color(0xFFFF6F6F),           // 柔和粉红
  primaryContainer: Color(0xFF2A4D4D),  // 暗绿色调，柔和
  secondary: Color(0xFF6A4C9B),         // 暗紫色，柔和
  secondaryContainer: Color(0xFF563B82),
  surface: Color(0xFF1E1E28),           // 深灰蓝，减少刺眼
  error: Color(0xFFCF6679),             // 柔和红
  onError: _darkFillColor,
  onPrimary: _darkFillColor,
  onSecondary: _darkFillColor,
  onSurface: Color(0xFFE0E0E0),         // 灰白文字，减少刺眼
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
