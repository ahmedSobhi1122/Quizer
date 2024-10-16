import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/constants/enum.dart';
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<ProfileCubit>().getProfile(DataIntent.getIdUser()!);
    // context.read<ProfileCubit>().getProfile(
    //     "82a31813-f954-46ef-b381-f98d00728708",
    //     "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiemVpYWQiLCJmYW1pbHlfbmFtZSI6Im1vaGFtbWVkIiwiZW1haWwiOiJ6YXphb3NrYXI5MjhAZ21haWwuY29tIiwibmJmIjoxNzI5MDI5NzI1LCJleHAiOjE3MzAyMzkzMjUsImlhdCI6MTcyOTAyOTcyNSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0._MKMlFzoLdMBek4Sb6fhsT25E46zcqw2aaYNxLjdpUL6nTKq-J0b211kKyIGInFkPQ7Z2Y2UOFvJVwGCvQVNzQ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Profile(
                  userRole: state.user.userRole,
                  firstName: state.user.firstName,
                  lastName: state.user.lastName,
                  rank: state.user.rank,
                  firstPlaceCount: state.user.firstPlaceCount,
                  secondPlaceCount: state.user.secondPlaceCount,
                  thirdPlaceCount: state.user.thirdPlaceCount,
                  description: state.user.description,
                  profileImage: Constants.url + state.user.profileImage!,
                  coverImage: Constants.url + state.user.coverImage!,
                );
              } else if (state is ProfileFailure) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Skeletonizer(
                  enabled: true,
                  child: Profile(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final UserRole? userRole;
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
    this.userRole,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 380.h,
          child: Stack(
            children: [
              Container(
                height: 290.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.profile),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: MainImage(imageUrl: coverImage??ImageAssets.profile,width: context.width,height: 290.h,),
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
                            context
                                .pushReplacementNamed(Routes.signUpScreenRoute);
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
                      CircleAvatar(
                        radius: 65.r,
                        backgroundColor: Colors.white, // Avatar image
                        child: CircleAvatar(
                          radius: 63.r,
                          backgroundImage: const AssetImage(ImageAssets.avatar),
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
                              (firstName ?? "Ahmed ") + (lastName ?? "Mohsen"),
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
    );
  }
}
