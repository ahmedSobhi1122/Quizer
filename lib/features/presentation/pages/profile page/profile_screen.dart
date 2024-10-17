import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/assets_manager.dart';

import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_appbar_rank.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/state/profile_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper/data_intent.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loading = false;
  String? firstName;
  String? lastName;
  Rank? rank;
  int? firstPlaceCount;
  int? secondPlaceCount;
  int? thirdPlaceCount;
  String? description;
  String? profileImage;
  String? coverImage;

  @override
  void initState() {
    super.initState();
    String? userID = DataIntent.getUserID();
    String? token = DataIntent.getToken();
    context.read<ProfileCubit>().getProfile(userID!,token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                firstName = state.user.firstName;
                lastName = state.user.lastName;
                rank = state.user.rank;
                firstPlaceCount = state.user.firstPlaceCount;
                secondPlaceCount = state.user.secondPlaceCount;
                thirdPlaceCount = state.user.thirdPlaceCount;
                description = state.user.description;
                profileImage = Constants.url + state.user.profileImage!;
                coverImage = Constants.url + state.user.coverImage!;
                _loading = false;
              }
              else if (state is ProfileFailure) {
                _loading = false;
                return Center(
                  child: Text(state.error),
                );
              }
              else if (state is ProfileLoading) {
                _loading = true;
              }
              return Skeletonizer(
                enabled: _loading,
                child: Profile(
                  firstName: firstName,
                  lastName: lastName,
                  rank: rank,
                  firstPlaceCount: firstPlaceCount,
                  secondPlaceCount: secondPlaceCount,
                  thirdPlaceCount: thirdPlaceCount,
                  description: description,
                  profileImage: profileImage,
                  coverImage: coverImage,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

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
                          BackButton(
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.editProfileScreenRoute);
                              print("Edit profile");
                            },
                            icon: const Icon(Icons.edit),
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
                      color: AppColors.gold,
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
