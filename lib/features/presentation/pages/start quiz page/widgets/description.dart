
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';


class Description extends StatelessWidget {
  final String description;
  const Description({
    super.key, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: context.width,),
        Text(
          "Description",
          style: AppTextStyles.statQuizTitleSectionTextStyle(context),
        ),
        SizedBox(height: AppSize.s18.h),
        Text(
          description,
          style: AppTextStyles.statQuizSubtitleSectionTextStyle(context),
        )
      ],
    );
  }
}