import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomProgress extends StatelessWidget {
  final double progress;

  const CustomProgress({super.key, this.progress = 100});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width * .558,
          height: context.height * .018,
          decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(13),
            color: AppColors.lightGreyColor,
          ),
        ),
        Container(
          width: (context.width * .558) / progress,
          height: context.height * .018,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.br13),
            gradient: const LinearGradient(colors: [
              AppColors.lightPurpleColor,
              AppColors.primaryColor,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
        ),
      ],
    );
  }
}
