import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 颜色扩展方法
extension ColorExtensions on Color {
  /// 获取颜色的明暗变体
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);

    return hsl.withLightness(lightness).toColor();
  }

  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);

    return hsl.withLightness(lightness).toColor();
  }

  /// 获取十六进制字符串
  String get hexString {
    final argb = toARGB32();
    return '#${argb.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }
}

/// 主题颜色集合
class ThemeColors {
  final Color primary;
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  const ThemeColors({
    this.primary = AppColors.primaryColor,
    this.success = AppColors.successColor,
    this.error = AppColors.errorColor,
    this.warning = AppColors.rmb205,
    this.info = AppColors.cyan6,
  });

  /// 获取浅色变体
  ThemeColors get light => ThemeColors(
    primary: primary.lighten(0.3),
    success: success.lighten(0.3),
    error: error.lighten(0.3),
    warning: warning.lighten(0.3),
    info: info.lighten(0.3),
  );

  /// 获取深色变体
  ThemeColors get dark => ThemeColors(
    primary: primary.darken(0.3),
    success: success.darken(0.3),
    error: error.darken(0.3),
    warning: warning.darken(0.3),
    info: info.darken(0.3),
  );
}
