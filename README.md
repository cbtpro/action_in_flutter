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

## 编译运行

### WEB

#### 运行命令

使用 flutter run来运行项目，选择 chrome，可以直接用下面的命令运行。

```
flutter run -d chrome
```

#### 构建模式

1. 默认模式 ``

   - 使用 `flutter run -d chrome` 或 `flutter build web`（不带 `--wasm`）默认构建。
   - 运行时使用 **CanvasKit** 渲染器。
     ([Flutter 文档][1])

2. WebAssembly（WASM）模式 `flutter run -d chrome`

   - 通过添加 `--wasm` 参数启用：

     ```bash
     flutter run -d chrome --wasm
     flutter build web --wasm
     ```
   - 该模式下运行时，会尝试用 **SkWasm** 渲染器（若浏览器支持垃圾回收），否则回退使用 CanvasKit。

#### 可用渲染器

- **CanvasKit**：基于 Skia 的 WebAssembly 引擎，适配性广、视觉体验一致，但会增加约 1.5MB 包体。
- **SkWasm**：一个更精简的 Skia WASM 渲染器，支持多线程渲染，在启用了 WASM 模式下可能优先使用。

#### 构建推荐方式总结

| 构建命令                           | 渲染器行为解释                          |
| ------------------------------ | -------------------------------- |
| `flutter build web`            | 默认模式，CanvasKit 渲染器               |
| `flutter build web --wasm`     | WASM 模式，优先使用 SkWasm，回退 CanvasKit |
| `flutter run -d chrome`        | 默认 HTML 模式已废弃 → 使用 CanvasKit     |
| **不再支持** `--web-renderer html` | 因 HTML 渲染器已废弃，无法使用               |

#### 建议与选择场景

* 推荐使用默认模式（CanvasKit）：稳定性好，视觉表现与移动端一致。
* 若希望更小包体、快速加载：可尝试 WASM 模式看看 SkWasm 是否可用。
* 避免再使用 HTML 渲染器，它已经不再可选。


[1]: https://docs.flutter.dev/platform-integration/web/renderers "Web renderers"

#### 输出目录

web 编译和运行时会放在：

```
build/web/
├── index.html
├── main.dart.js
├── flutter_service_worker.js
└── assets/
```
直接部署到任意静态服务器（如 Nginx、Apache、Vercel、Netlify）即可。