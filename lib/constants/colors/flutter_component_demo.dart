import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_in_flutter/utils/device/platform_utils.dart';
import 'app_colors.dart';

class FlutterComponentsDemo extends StatefulWidget {
  const FlutterComponentsDemo({super.key});

  @override
  State<FlutterComponentsDemo> createState() => _FlutterComponentsDemoState();
}

class _FlutterComponentsDemoState extends State<FlutterComponentsDemo> {
  // 状态变量
  bool switchValue = true;
  bool checkboxValue = true;
  int radioValue = 1;
  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final bool isCupertino = PlatformUtils.isCupertino;

    return isCupertino
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Flutter 组件示例'),
            ),
            child: SafeArea(child: _buildBody(context, isCupertino)),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Flutter 组件示例'),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
            ),
            body: _buildBody(context, isCupertino),
          );
  }

  Widget _buildBody(BuildContext context, bool isCupertino) {
    // 文本输入框
    Widget platformTextField({required String label}) => isCupertino
        ? CupertinoTextField(
            placeholder: label,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.green1),
              borderRadius: BorderRadius.circular(8),
            ),
          )
        : TextField(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
          );

    // 按钮
    Widget platformButton({
      required String text,
      required VoidCallback onPressed,
    }) => isCupertino
        ? CupertinoButton.filled(onPressed: onPressed, child: Text(text))
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
            ),
            child: Text(text),
          );

    // 开关
    Widget platformSwitch() => isCupertino
        ? CupertinoSwitch(
            value: switchValue,
            onChanged: (v) => setState(() => switchValue = v),
          )
        : Switch(
            value: switchValue,
            onChanged: (v) => setState(() => switchValue = v),
          );

    // 复选框
    Widget platformCheckbox() => isCupertino
        ? GestureDetector(
            onTap: () => setState(() => checkboxValue = !checkboxValue),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                color: checkboxValue
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: checkboxValue
                  ? const Icon(Icons.check, size: 20, color: Colors.white)
                  : null,
            ),
          )
        : Checkbox(
            value: checkboxValue,
            onChanged: (v) => setState(() => checkboxValue = v!),
          );

    // 单选框
    Widget platformRadio(int value) => isCupertino
        ? GestureDetector(
            onTap: () => setState(() => radioValue = value),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.black),
              ),
              child: radioValue == value
                  ? Center(
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
          )
        : Radio<int>(
            value: value,
            groupValue: radioValue,
            onChanged: (v) => setState(() => radioValue = v!),
          );

    // 滑块
    Widget platformSlider() => isCupertino
        ? CupertinoSlider(
            value: sliderValue,
            onChanged: (v) => setState(() => sliderValue = v),
            min: 0.0,
            max: 1.0,
          )
        : Slider(
            value: sliderValue,
            onChanged: (v) => setState(() => sliderValue = v),
            min: 0.0,
            max: 1.0,
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.blue3,
          );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('文本组件'),
          Text('这是普通文本', style: TextStyle(color: AppColors.black)),
          RichText(
            text: TextSpan(
              text: 'Rich ',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
              children: [
                TextSpan(
                  text: 'Text',
                  style: TextStyle(
                    color: AppColors.errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _sectionTitle('输入框组件'),
          platformTextField(label: "TextField"),
          const SizedBox(height: 8),
          platformTextField(label: "TextFormField"),
          const SizedBox(height: 16),

          _sectionTitle('按钮组件'),
          Row(
            children: [
              platformButton(text: '主要按钮', onPressed: () {}),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.thumb_up),
                color: AppColors.successColor,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          _sectionTitle('开关和选择'),
          Row(
            children: [
              platformCheckbox(),
              const SizedBox(width: 8),
              const Text('Checkbox', style: TextStyle(color: AppColors.black)),
            ],
          ),
          Row(
            children: [
              platformRadio(1),
              const SizedBox(width: 8),
              const Text('Radio 1', style: TextStyle(color: AppColors.black)),
            ],
          ),
          Row(
            children: [
              platformRadio(2),
              const SizedBox(width: 8),
              const Text('Radio 2', style: TextStyle(color: AppColors.black)),
            ],
          ),
          Row(
            children: [
              platformSwitch(),
              const SizedBox(width: 8),
              const Text('Switch', style: TextStyle(color: AppColors.black)),
            ],
          ),
          platformSlider(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
  );
}
