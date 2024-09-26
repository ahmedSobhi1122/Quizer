import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          width:  AppSize.s240.w,
          height: AppSize.s16.h,
          decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
            color: AppColors.lightGreyColor,
          ),
        ),
        Container(
          width: AppSize.s240.w / progress.w,
          height: AppSize.s16.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
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
