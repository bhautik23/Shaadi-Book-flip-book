import 'package:flutter/material.dart';
import 'package:shaadi_book/my_app_config/app_color_constants.dart';

class MaskingDot extends StatefulWidget {
  const MaskingDot({super.key});

  @override
  State<MaskingDot> createState() => _MaskingDotState();
}

class _MaskingDotState extends State<MaskingDot> {
  final _list = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _list.map((e) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: AppColorConstant.fontColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
        );
      }).toList(),
    );
  }
}
