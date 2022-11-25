import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelText extends StatelessWidget {
  final String title;
  final String value;

  const LabelText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Get.textTheme.caption),
        const SizedBox(height: 2),
        Text(value, style: Get.textTheme.subtitle1)
      ],
    );
  }
}
