import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomProgress extends StatefulWidget {
  final double start;
  final double end;

  const CustomProgress({super.key, this.end = 100, this.start = 100});

  @override
  State<CustomProgress> createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    _width = (widget.start == 0) ? 0 : AppSize.s240.w / widget.start;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = AppSize.s240.w / widget.end;
      });
    });
    return Stack(
      children: [
        Container(
          width: AppSize.s240.w,
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
