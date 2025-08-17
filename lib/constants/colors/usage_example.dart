import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'color_extensions.dart';

class ColorUsageExample extends StatelessWidget {
  const ColorUsageExample({super.key});

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isCupertino) {
      // iOS / macOS 用 Cupertino 风格
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('颜色使用示例')),
        child: SafeArea(child: _buildBody()),
      );
    } else {
      // 其他平台（Android / Web / Windows / Linux）用 Material 风格
      return Scaffold(
        appBar: AppBar(
          title: const Text('颜色使用示例'),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
        body: _buildBody(),
      );
    }
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColorSection('主题颜色', [
            _ColorItem('Primary', AppColors.primaryColor),
            _ColorItem('Success', AppColors.successColor),
            _ColorItem('Error', AppColors.errorColor),
          ]),
          const SizedBox(height: 24),
          _buildColorSection('蓝色色阶', [
            _ColorItem('Blue 1', AppColors.blue1),
            _ColorItem('Blue 2', AppColors.blue2),
            _ColorItem('Blue 3', AppColors.blue3),
            _ColorItem('Blue 4', AppColors.blue4),
            _ColorItem('Blue 5', AppColors.blue5),
            _ColorItem('Blue 6', AppColors.blue6),
            _ColorItem('Blue 7', AppColors.blue7),
            _ColorItem('Blue 8', AppColors.blue8),
            _ColorItem('Blue 9', AppColors.blue9),
            _ColorItem('Blue 10', AppColors.blue10),
          ]),
          const SizedBox(height: 24),
          _buildColorSection('红色色阶', [
            _ColorItem('Red 1', AppColors.red1),
            _ColorItem('Red 2', AppColors.red2),
            _ColorItem('Red 3', AppColors.red3),
            _ColorItem('Red 4', AppColors.red4),
            _ColorItem('Red 5', AppColors.red5),
          ]),
          const SizedBox(height: 24),
          _buildUsageExample(),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, List<_ColorItem> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: colors.map((item) => _buildColorCard(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildColorCard(_ColorItem item) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.black.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _getContrastColor(item.color),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.color.hexString,
            style: TextStyle(
              fontSize: 10,
              color: _getContrastColor(item.color).withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '使用示例',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            PlatformUtils.isCupertino
                ? CupertinoButton.filled(
                    onPressed: () {},
                    child: const Text('主要按钮'),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('主要按钮'),
                  ),
            const SizedBox(width: 8),
            PlatformUtils.isCupertino
                ? CupertinoButton(
                    color: AppColors.successColor,
                    onPressed: () {},
                    child: const Text('成功按钮'),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successColor,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('成功按钮'),
                  ),
            const SizedBox(width: 8),
            PlatformUtils.isCupertino
                ? CupertinoButton(
                    color: AppColors.errorColor,
                    onPressed: () {},
                    child: const Text('错误按钮'),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.errorColor,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('错误按钮'),
                  ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.blue3),
          ),
          child: const Text(
            '这是一个使用蓝色主题的卡片示例',
            style: TextStyle(color: AppColors.blue8),
          ),
        ),
      ],
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }
}

class _ColorItem {
  final String name;
  final Color color;

  const _ColorItem(this.name, this.color);
}
