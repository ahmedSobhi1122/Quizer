import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.colorText,
    this.borderColor = AppColors.purpleColor,
    this.width,
  });

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double? width;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: width ?? AppSize.s335.w,
        height: AppSize.s60.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            // fixedSize: Size(AppSize.s350.w, AppSize.s60.h),
            backgroundColor: color,
            splashFactory: InkRipple.splashFactory,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br24.r),
              side: BorderSide(color: borderColor),
            ),
          ),
          child: Text(
            text,
            style:
                AppTextStyles.customButtonTextStyle(context, color: colorText),
          ),
        ),
      ),
    );
  }
}

/*
OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br24.r),
            ),
            elevation: 0,
            side: const BorderSide(color: AppColors.purpleColor),
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.customButtonTextStyle(context, colorText),
          ),
        ),
    */
