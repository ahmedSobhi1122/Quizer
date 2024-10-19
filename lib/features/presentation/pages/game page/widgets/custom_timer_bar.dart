import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/pages/game%20page/widgets/custom_timer.dart';
import '../../../../../config/routes/screen_export.dart';
import '../../../../../config/themes/theme.dart';

class CustomTimerBar extends StatelessWidget {
  final void Function()? onTap;
  final int currentQuestionIndex;
  final int totalQuestions;
  final double durationInMinutes; // The duration of the timer in minutes

  const CustomTimerBar({
    super.key,
    this.onTap,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.durationInMinutes, // Accept the timer duration
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppPadding.p50.h,
      left: AppPadding.p24.w,
      right: AppPadding.p24.w,
      child: Container(
        width: context.width,
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          color: MyTheme.disabledColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: Icon(
                Icons.close,
                size: AppSize.s36.r,
                color: MyTheme.textColor,
              ),
            ),
            // Pass the durationInMinutes to the CustomProgress widget
            CustomTimer(
              durationInMinutes: durationInMinutes, // Timer duration in minutes
            ),
            Text(
              "${currentQuestionIndex + 1}/$totalQuestions",
              style: AppTextStyles.leaderboardTitleTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
