import 'package:flutter/material.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/assets_manager.dart';

import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/custom_appbar_rank.dart';

class Profile extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final Rank? rank;
  final int? firstPlaceCount;
  final int? secondPlaceCount;
  final int? thirdPlaceCount;
  final String? description;
  final String? profileImage;
  final String? coverImage;

  const Profile({
    super.key,
    this.firstName,
    this.lastName,
    this.rank,
    this.firstPlaceCount,
    this.secondPlaceCount,
    this.thirdPlaceCount,
    this.description,
    this.profileImage,
    this.coverImage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 380.h,
            child: Stack(
              children: [
                SizedBox(
                  height: 290.h,
                  width: context.width,
                  child: ImageManager(
                    url: coverImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p16.w, vertical: AppPadding.p38.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: BackButton(
                              onPressed: () {
                                context
                                    .pushReplacementNamed(Routes.MainScreenRoute);
                              },
                          )),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: IconButton(
                              onPressed: () {
                                context.pushReplacementNamed(
                                    Routes.editProfileScreenRoute);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: MyTheme.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -5.h,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Row(
                      children: [
                        Container(
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
                                url: profileImage,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Text(
                                "${firstName ?? "Ahmed "} ${lastName ?? "Mohsen"}",
                                style: TextStyle(
                                  color: MyTheme.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSize.f17,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomAppBarRank(
                                rank: (rank?.name) ?? "Newbie",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 115.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: MyTheme.textColor, width: 1.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Image.asset(ImageAssets.goldMedal),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        firstPlaceCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: MyTheme.textColor,
                          fontSize: FontSize.f15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 115.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                      color: AppColors.silver,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: MyTheme.textColor, width: 1.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Image.asset(ImageAssets.silverMedal),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        secondPlaceCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: MyTheme.textColor,
                            fontSize: FontSize.f15),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 115.h,
                  width: 115.w,
                  decoration: BoxDecoration(
                      color: AppColors.bronze,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: MyTheme.textColor, width: 1.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Image.asset(ImageAssets.bronzeMedal),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        thirdPlaceCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: MyTheme.textColor,
                            fontSize: FontSize.f15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Achievements",
                  style: TextStyle(
                      fontSize: FontSize.f24,
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward3,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward4,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward5,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward3,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward4,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 68.h,
                          width: 68.w,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: MyTheme.textColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p5),
                            child: Image.asset(
                              ImageAssets.reward5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "About",
                  style: TextStyle(
                      fontSize: FontSize.f24,
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  description ??
                      "A brief description of Jackson Logan as a UI/UX designer, emphasizing his experience in creating visually appealing and functional designs. It mentions his interest in a variety of design and programming tools.",
                  style: TextStyle(
                      fontSize: FontSize.f18,
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
