
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';


class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppTextStyles.statQuizTitleSectionTextStyle(context),
        ),
        SizedBox(height: AppSize.s18.h),
        Text(
          "Awesome job completing a  quick test. Your results are zooming their way to your inbox. Sharing is caring, don't forget to show off your knowledge to friends and fam!",
          style: AppTextStyles.statQuizSubtitleSectionTextStyle(context),
        )
      ],
    );
  }
}