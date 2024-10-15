import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';

class Background extends StatelessWidget {
  final Widget child;

  final double? paddingLeft, paddingRight, paddingTop;
  final double? myWidth, myhHeight;
  final List<Color>? colors;

  const Background({
    super.key,
    required this.child,
    this.paddingLeft = AppPadding.zero,
    this.paddingRight = AppPadding.zero,
    this.paddingTop = AppPadding.zero,
    this.myWidth,
    this.myhHeight,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth ?? context.width,
      height: myhHeight ?? context.height,
      padding: EdgeInsets.only(
          top: paddingTop!.h, right: paddingRight!.w, left: paddingLeft!.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors ??
                [
                  MyTheme.backgroundColor1,
                  MyTheme.backgroundColor2,
                  MyTheme.backgroundColor3,
                ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}