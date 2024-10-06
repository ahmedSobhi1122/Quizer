import 'package:flutter/material.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/assets_manager.dart';

import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s0,
        paddingLeft: AppSize.s0,
        paddingTop: AppSize.s0,
        child: SingleChildScrollView(
          child: Column(
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
                              fit: BoxFit.cover),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w,vertical: AppPadding.p38.h),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              BackButton(
                                onPressed: (){context.pushReplacementNamed(Routes.signUpScreenRoute);},
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
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
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 65.r,
                                  backgroundColor: Colors.white, // Avatar image
                                  child: CircleAvatar(
                                    radius: 63.r,
                                    backgroundImage: AssetImage(ImageAssets.avatar),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 9,
                                  child: CircleAvatar(
                                    radius: 10.r,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(AppPadding.p12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(height: 50.h,),
                                  Text(
                                    "Ahmed Mohsen",
                                    style: TextStyle(
                                      color: AppColors.blackColor80,
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSize.f17,
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p8,vertical: AppPadding.p2),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Expert",
                                        style: TextStyle(
                                            color: AppColors.blackColor80,
                                            fontSize: FontSize.f15,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
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
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Row(
                  children: [
                      Container(
                        height: 115.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.black, width: 1.w)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              child: Image.asset(
                                ImageAssets.gold_medal
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                                "12",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: AppColors.blackColor60,
                                fontSize: FontSize.f15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 115.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                            color: AppColors.silver,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.black, width: 1.w)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              child: Image.asset(
                                  ImageAssets.silver_medal
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "32",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: AppColors.blackColor60,
                                fontSize: FontSize.f15
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 115.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.black, width: 1.w)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              child: Image.asset(
                                  ImageAssets.bronze_medal
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "71",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: AppColors.blackColor60,
                                fontSize: FontSize.f15
                              ),
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
                        color: AppColors.blackColor80,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.h,),
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                                  color: AppColors.blackColor80,
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
                    SizedBox(height: 20.h,),
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: FontSize.f24,
                          color: AppColors.blackColor80,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "A brief description of Jackson Logan as a UI/UX designer, emphasizing his experience in creating visually appealing and functional designs. It mentions his interest in a variety of design and programming tools.",
                      style: TextStyle(
                          fontSize: FontSize.f18,
                          color: AppColors.blackColor80,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
