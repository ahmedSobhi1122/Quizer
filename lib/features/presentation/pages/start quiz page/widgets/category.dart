
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';


class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quiz Information",
          style: AppTextStyles.statQuizTitleSectionTextStyle(context),
        ),
        SizedBox(height: AppSize.s18.h),
        Row(
          children: [
            Text(
              "Category :",
              style: AppTextStyles.statQuizTitleInformationTextStyle(context),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text(
              "Math",
              style: AppTextStyles.statQuizInformationTextStyle(context),
            )
          ],
        ),
        SizedBox(height: AppSize.s10.h),
        Row(
          children: [
            Text(
              "Time :",
              style: AppTextStyles.statQuizTitleInformationTextStyle(context),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text(
              "X minutes",
              style: AppTextStyles.statQuizInformationTextStyle(context),
            )
          ],
        ),
        SizedBox(height: AppSize.s10.h),
        Row(
          children: [
            Text(
              "Number of questions :",
              style: AppTextStyles.statQuizTitleInformationTextStyle(context),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text(
              "X questions",
              style: AppTextStyles.statQuizInformationTextStyle(context),
            )
          ],
        ),
      ],
    );
  }
}