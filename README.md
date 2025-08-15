# action_in_flutter

一个新的 Flutter 项目。

## 入门指南

此项目是一个 Flutter 应用的起点。

如果这是你第一次接触 Flutter，这里有一些入门资源可以参考：

* [实验：编写你的第一个 Flutter 应用](https://docs.flutter.dev/get-started/codelab)
* [食谱：实用的 Flutter 示例](https://docs.flutter.dev/cookbook)

想要了解更多关于 Flutter 开发的帮助，请查看
[在线文档](https://docs.flutter.dev/)，其中提供了教程、示例、移动开发指南以及完整的 API 参考。

使用[`names_launcher`](https://pub.dev/packages/names_launcher)修改 ios、安卓应用名称

```shell
flutter pub get
dart run names_launcher:change
```

## 目录结构

```
lib/
├─ di/                        // 依赖注入相关
│  ├─ injection.dart          // 全局依赖注册入口
│  └─ modules/                // 按模块拆分依赖注册（可选）
│     └─ post_module.dart
│
├─ core/                      // 核心功能、全局工具
│  ├─ utils/                  // 工具类、扩展方法
│  ├─ constants/              // 全局常量
│  └─ data/network/           // 网络请求相关
│     ├─ dio/                 // Dio 配置、拦截器
│     └─ rest_client.dart
│
├─ data/                      // 数据层：Repository、API、数据源
│  ├─ network/                // API 接口定义
│  │  └─ post_api.dart
│  └─ repository/             // 数据仓库实现
│     └─ post_repository.dart
│
├─ domain/                    // 业务层：实体、UseCase
│  ├─ entity/                 // 实体类
│  │  └─ post/                // post 相关实体
│  │     ├─ post.dart
│  │     └─ post_list.dart
│  └─ usecase/                // 用例
│     └─ get_posts.dart
│
├─ presentation/              // UI 层：页面、组件、状态管理
│  ├─ post/                   // post 模块
│  │  ├─ store/               // MobX / Provider / Riverpod 等状态管理
│  │  │  └─ post_store.dart
│  │  ├─ page/                // 页面
│  │  │  └─ post_page.dart
│  │  └─ widgets/             // 可复用组件
│  │     └─ post_item_widget.dart
│  └─ common/                 // 全局组件
│     └─ counter_widget.dart
│
└─ main.dart                  // 程序入口
```