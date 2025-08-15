import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;

/// 工具类，用于判断当前平台和风格
class PlatformUtils {
  PlatformUtils._(); // 私有构造函数，避免实例化

  /// 是否使用 Cupertino 风格（iOS / macOS 且非 Web）
  /// 
  /// - 如果当前运行在 Web 上，则返回 false
  /// - 如果当前运行在 iOS 或 macOS 上，则返回 true
  /// - 其他平台（Android / Linux / Windows / Fuchsia）返回 false
  ///
  /// 这样可以方便在各个组件里统一判断，决定使用 Cupertino 或 Material 风格
  static bool get isCupertino {
    // kIsWeb 表示是否运行在 Web
    if (kIsWeb) return false;

    // defaultTargetPlatform 表示当前平台类型
    // TargetPlatform.iOS / TargetPlatform.macOS 表示 Apple 平台
    return defaultTargetPlatform == TargetPlatform.iOS ||
           defaultTargetPlatform == TargetPlatform.macOS;
  }

  /// 是否使用 Material 风格（非 Cupertino 平台）
  ///
  /// Material 风格包含 Android / Windows / Linux / Web 等
  static bool get isMaterial => !isCupertino;
}
