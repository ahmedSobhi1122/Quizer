import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';

class Background extends StatelessWidget {
  final Widget child;

  final double? paddingLeft, paddingRight, paddingTop;

  const Background({
    super.key,
    required this.child,
    this.paddingLeft = AppPadding.zero,
    this.paddingRight = AppPadding.zero,
    this.paddingTop = AppPadding.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      padding: EdgeInsets.only(
          top: paddingTop!.h, right: paddingRight!.w, left: paddingLeft!.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          context.primaryColorScheme,
          context.secondaryColorScheme,
          context.tertiaryColorScheme,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
