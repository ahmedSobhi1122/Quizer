import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomProgress extends StatefulWidget {
  final double progress;

  const CustomProgress({super.key, this.progress = 100});

  @override
  State<CustomProgress> createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  var _width;

  @override
  void initState() {
    super.initState();
    _width = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = AppSize.s240.w / widget.progress;
      });
    });
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
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _width,
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
