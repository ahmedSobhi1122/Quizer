import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';

import '../../../../config/routes/screen_export.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../common/background.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: MyTheme.textColor,
        ),
        title: Text(
          "Leaderboard",
          style: AppTextStyles.leaderboardTitleTextStyle(context),
        ),
        backgroundColor: MyTheme.backgroundColor,
      ),
      backgroundColor: MyTheme.backgroundColor,
      body: Stack(children: [
        Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: AppSize.s630.h,
                  width: AppSize.s116.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageManager(
                        url: 'assets/svg/silver_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 45.r,
                        child: Container(
                          width: 100.r,
                          height: 100.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                            color: AppColors.whiteColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteColor.withOpacity(0.80),
                                width: AppSize.s2.r,
                              ),
                            ),
                            child: const ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: ImageAssets.defaultImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.silver,
                                  MyTheme.backgroundColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, .23]),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  AppBorderRadius.defaultBorderRadius),
                            ),
                          ),
                          width: AppSize.s116.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: AppPadding.defaultPadding.w,
                                  right: AppPadding.defaultPadding.w,
                                  top: AppPadding.defaultPadding.h,
                                ),
                                child: Text(
                                  'Abdo Mohamed',
                                  style:
                                      AppTextStyles.leaderBoardTitleTextStyle(
                                          context),
                                ),
                              ),
                              Text(
                                '1550 points',
                                style:
                                    AppTextStyles.leaderBoardSubtitleTextStyle(
                                        context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s690.h,
                  width: AppSize.s116.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/golden_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 45.r,
                        child: Container(
                          width: 100.r,
                          height: 100.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                            color: AppColors.whiteColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteColor.withOpacity(0.80),
                                width: AppSize.s2.r,
                              ),
                            ),
                            child: const ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: ImageAssets.defaultImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.gold,
                                  MyTheme.backgroundColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, .3]),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  AppBorderRadius.defaultBorderRadius),
                            ),
                          ),
                          width: AppSize.s116.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: AppPadding.defaultPadding.w,
                                  right: AppPadding.defaultPadding.w,
                                  top: AppPadding.defaultPadding.h,
                                ),
                                child: Text(
                                  'Mohamed',
                                  style:
                                      AppTextStyles.leaderBoardTitleTextStyle(
                                          context),
                                ),
                              ),
                              Text(
                                '1750 points',
                                style:
                                    AppTextStyles.leaderBoardSubtitleTextStyle(
                                        context),
                              ),
                              // Add more children as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s650.h,
                  width: AppSize.s116.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageManager(
                        url: 'assets/svg/bronze_medal.svg',
                        height: AppSize.s40.h,
                        width: AppSize.s40.h,
                      ),
                      CircleAvatar(
                        radius: 45.r,
                        child: Container(
                          width: 100.r,
                          height: 100.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                            color: AppColors.whiteColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteColor.withOpacity(0.80),
                                width: AppSize.s2.r,
                              ),
                            ),
                            child: const ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: ImageAssets.defaultImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  AppColors.bronze,
                                  MyTheme.backgroundColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, .23]),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  AppBorderRadius.defaultBorderRadius),
                            ),
                          ),
                          width: AppSize.s116.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: AppPadding.defaultPadding.w,
                                  right: AppPadding.defaultPadding.w,
                                  top: AppPadding.defaultPadding.h,
                                ),
                                child: Text(
                                  'Abdo Mohamed',
                                  style:
                                      AppTextStyles.leaderBoardTitleTextStyle(
                                          context),
                                ),
                              ),
                              Text(
                                '1600 points',
                                style:
                                    AppTextStyles.leaderBoardSubtitleTextStyle(
                                        context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        MyDraggableSheet(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class MyDraggableSheet extends StatelessWidget {
  final Widget child;

  const MyDraggableSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.512.h,
      minChildSize: 0.512.h,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                MyTheme.backgroundColor1,
                MyTheme.backgroundColor2,
                MyTheme.backgroundColor3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppBorderRadius.br24),
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            padding: EdgeInsets.all(AppPadding.p30.r),
            itemBuilder: (context, index) {
              return const UserProfileCard(
                name: 'khaled',
                points: 150,
                rank: 3,
              );
            },
            // Link the ListView to the ScrollController
          ),
        );
      },
    );
  }
}

class UserProfileCard extends StatelessWidget {
  final String name;
  final int points;
  final int rank;

  const UserProfileCard(
      {super.key,
      required this.name,
      required this.points,
      required this.rank});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
      child: Container(
        padding: EdgeInsets.all(AppPadding.p16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.br8),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
              child: const ClipOval(
                child: ImageManager(
                  width: AppSize.s60,
                  fit: BoxFit.cover,
                  url: ImageAssets.defaultImage,
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
