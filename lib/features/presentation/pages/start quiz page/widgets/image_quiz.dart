
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';

class ImageQuiz extends StatelessWidget {
  const ImageQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s380.w,
      height: AppSize.s200.h,
      child: Stack(
        children: [
          SizedBox(
            width: AppSize.s380.w,
            height: AppSize.s200.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              child: Image.asset(
                ImageAssets.defaultImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.br16),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.blackColor.withOpacity(0.8),
                  ],
                  stops: const [0.6, 1.0], // Control how much shadow appears
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppSize.s8.h,
            left: AppSize.s16.w,
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: AppMargin.m12.w),
                      height: AppSize.s28.h,
                      width: AppSize.s28.h,
                      decoration: BoxDecoration(
                          border: Border.all(), shape: BoxShape.circle),
                      child: SvgPicture.asset(SVGAssets.avatar),
                    ),
                    Text(
                      "Ahmed Mohsen",
                      style: AppTextStyles.statQuizNameTextStyle(context),
                    ),
                  ],
                ),
                SizedBox(width: AppSize.s150.w),
                Stack(
                  children: [
                    Icon(
                      Icons.person,
                      size: AppSize.s48.r,
                      color: AppColors.whiteColor,
                    ),
                    Positioned(
                      top: AppSize.s28.h,
                      left: AppSize.s18.w,
                      child: Center(
                        child: Text(
                          "24",
                          style: AppTextStyles.statQuizNumberTextStyle(context),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}