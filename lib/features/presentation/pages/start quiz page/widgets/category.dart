
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';


class Category extends StatelessWidget {
  final int? maxTime;
  final int? questionsCount;
  const Category({
    super.key, this.maxTime, this.questionsCount,
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
              "Time :",
              style: AppTextStyles.statQuizTitleInformationTextStyle(context),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text(
              maxTime != null ? "$maxTime minutes" : "X minutes",
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
            Text( questionsCount != null ? "$questionsCount questions" : "X questions",
              style: AppTextStyles.statQuizInformationTextStyle(context),
            )
          ],
        ),
      ],
    );
  }
}