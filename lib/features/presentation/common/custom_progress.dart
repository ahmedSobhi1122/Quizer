import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomProgress extends StatefulWidget {
  final double? start;
  final double? end;
  final Color borderColor;
  final Color backgroundColor;
  final List<Color> foregroundGradientColors;

  const CustomProgress(
      {super.key,
      this.end,
      this.start,
      this.borderColor = AppColors.whiteColor,
      this.backgroundColor = AppColors.lightGreyColor,
      this.foregroundGradientColors = const [
        AppColors.lightPurpleColor,
        AppColors.primaryColor,
      ]});

  @override
  State<CustomProgress> createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    _width = (widget.start == 0) ? 0 : AppSize.s240.w / (widget.start ?? 100);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = (widget.end == 0) ? 0 : AppSize.s240.w / (widget.end ?? 100);
        print("setState");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSize.s240.w,
          height: AppSize.s16.h,
          decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, color: widget.borderColor),
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
            color: widget.backgroundColor,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _width,
          height: AppSize.s16.h,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.br13.r),
            gradient:  LinearGradient(colors: widget.foregroundGradientColors, begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
        ),
      ],
    );
  }
}
