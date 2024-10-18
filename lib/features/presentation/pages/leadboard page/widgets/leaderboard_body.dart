
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/presentation/pages/leadboard%20page/widgets/my_sheet.dart';

class Screen extends StatelessWidget {
  final List<User>? users;

  const Screen({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: AppSize.s650.h,
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
                            child: ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: Constants.url +
                                    (users?[1].profileImage ?? ""),
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
                                  "${users?[1].firstName ?? ""} ${users?[1].lastName ?? ""}",
                                  style:
                                  AppTextStyles.leaderBoardTitleTextStyle(
                                      context),
                                ),
                              ),
                              Text(
                                '${users?[1].points ?? 0} points',
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
                            child: ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: Constants.url +
                                    (users?[0].profileImage ?? ""),
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
                                  "${users?[0].firstName ?? ""} ${users?[0].lastName ?? ""}",
                                  style:
                                  AppTextStyles.leaderBoardTitleTextStyle(
                                      context),
                                ),
                              ),
                              Text(
                                '${users?[0].points ?? 0} points',
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
                  height: AppSize.s630.h,
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
                            child: ClipOval(
                              child: ImageManager(
                                width: AppSize.s60,
                                fit: BoxFit.cover,
                                url: Constants.url +
                                    (users?[2].profileImage ?? ""),
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
                                  "${users?[2].firstName ?? ""} ${users?[2].lastName ?? ""}",
                                  style:
                                  AppTextStyles.leaderBoardTitleTextStyle(
                                      context),
                                ),
                              ),
                              Text(
                                '${users?[2].points ?? 0} points',
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
          users: users,
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
      ],
    );
  }
}

