import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';

class OrLine extends StatelessWidget {
  const OrLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: AppSize.s140.w,
          height: AppSize.s1_5.h,
          color: AppColors.lightGreyColor,
        ),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding.w),
          child: Text(
            "OR",
            style: AppTextStyles.orTextStyle(context),
          ),
        ),
        Container(
          width: AppSize.s140.w,
          height: AppSize.s1_5.h,
          color: AppColors.lightGreyColor,
        ),
      ],
    );
  }
}
