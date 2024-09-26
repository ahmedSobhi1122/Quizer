import 'package:flutter/material.dart';
import 'package:quizer/core/resources/app_colors.dart';

class Checkable extends StatefulWidget {
  const Checkable({super.key});

  @override
  State<Checkable> createState() => _CheckableState();
}

class _CheckableState extends State<Checkable> {
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: AppColors.purpleColor,
        value: check,
        onChanged: (val) {
          setState(() {
            check = val;
          });
        });
  }
}
