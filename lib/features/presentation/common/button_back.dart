import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }
}
