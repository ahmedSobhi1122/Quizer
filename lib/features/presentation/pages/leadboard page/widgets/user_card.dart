
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String url;
  final int points;
  final int rank;

  const UserProfileCard({
    super.key,
    required this.name,
    required this.points,
    required this.rank,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
      child: Container(
        padding: EdgeInsets.all(AppPadding.p16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.br8),
          boxShadow: const [
            BoxShadow(
              color: MyTheme.textColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: AppSize.s40.w,
              height: AppSize.s40.h,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$rank',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSize.s10.w),
            Container(
              width: 70.r,
              height: 70.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppSize.s2.r,
                ),
              ),
              child: ClipOval(
                child: ImageManager(
                  width: AppSize.s60,
                  fit: BoxFit.cover,
                  url: url,
                ),
              ),
            ),
            SizedBox(width: AppSize.s16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.leaderBoardTitleTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Text(
                    '$points points',
                    style: AppTextStyles.leaderBoardSubtitleTextStyle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
