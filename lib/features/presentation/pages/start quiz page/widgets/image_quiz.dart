
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';

class ImageQuiz extends StatelessWidget {
  final String? imageUrl;
  final String? authorImageUrl;
  final String? authorName;
  final int? playCount;
  const ImageQuiz({
    super.key, this.imageUrl, this.authorImageUrl, this.authorName, this.playCount,
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
              child: ImageManager(fit: BoxFit.cover,url: imageUrl?? ImageAssets.defaultImage,),
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
            width: AppSize.s350.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: AppMargin.m12.w),
                      height: AppSize.s48.r,
                      width: AppSize.s48.r,
                      decoration: BoxDecoration(
                          border: Border.all(), shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppBorderRadius.br32),
                          child: ImageManager(url: authorImageUrl ?? ImageAssets.defaultImage,fit: BoxFit.fill,)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: AppSize.s16.h),
                        Text(
                          authorName ?? "Default Name",
                          style: AppTextStyles.statQuizNameTextStyle(context),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        child: Text( playCount != null ? "$playCount" : "24",
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