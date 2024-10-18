import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/state/profile_state.dart';

import '../../common/custom_button_with_shadow.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // String id = "55268294-54c4-424f-8547-c83b1672053b";
  // String token =
  //     "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJnaXZlbl9uYW1lIjoiWmVpYWQiLCJmYW1pbHlfbmFtZSI6Ik1vaGFtbWVkIiwiZW1haWwiOiJ6ZWlhZG00YnVzaW5lc3NAZ21haWwuY29tIiwibmJmIjoxNzI5MTkzOTY2LCJleHAiOjE3MzE4NzU5NjYsImlhdCI6MTcyOTE5Mzk2NiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjI2In0.qbQi3s0NO8TC7SVc1fKTdenU1W6Rg98Yh4A0-eoAoukfxGBIFCY1KCYVmMPrFzj42gwNnnWoH_G3m9-XuGa73g";
  String? id = DataIntent.getUserID();
  String? token = DataIntent.getToken();
  String? _userName = "Ahmed Mohsen";

  String? _aboutMe =
      "A brief description of Jackson Logan as a UI/UX designer, emphasizing his experience in creating visually appealing and functional designs. It mentions his interest in a variety of design and programming tools.";

  final nameController = TextEditingController();

  final aboutController = TextEditingController();

  File? _imageCover;
  File? _imageProfile;

  @override
  void initState() {
    nameController.text = _userName!;
    aboutController.text = _aboutMe!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 380.h,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 290.h,
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileCoverSelected) {
                            _imageCover = state.image;
                          }
                          return ImageUploadField(
                            fitter: BoxFit.cover,
                            onImageSelected: () async {
                              await context
                                  .read<ProfileCubit>()
                                  .coverImageSelection();
                            },
                            image: _imageCover,
                          );
                        },
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
                              backgroundColor: MyTheme.textColor,
                              // Avatar image
                              child: CircleAvatar(
                                radius: 63.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child:
                                      BlocBuilder<ProfileCubit, ProfileState>(
                                    builder: (context, state) {
                                      if (state is ProfileAvatarSelected) {
                                        _imageProfile = state.image;
                                      }
                                      return ImageUploadField(
                                        fitter: BoxFit.cover,
                                        onImageSelected: () async {
                                          await context
                                              .read<ProfileCubit>()
                                              .profileImageSelection();
                                        },
                                        image: _imageProfile,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: FontSize.f24,
                          color: MyTheme.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 70.h,
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        maxLength: 30,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: FontSize.f18,
                            color: AppColors.blackColor80,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: FontSize.f24,
                          color: MyTheme.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 200.h,
                      child: TextField(
                        controller: aboutController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        maxLength: 500,
                        maxLines: 15,
                        style: TextStyle(
                            fontSize: FontSize.f18,
                            color: AppColors.blackColor80,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                      child: Row(children: [
                        Expanded(
                          child: CustomButton(
                            text: "Cancel",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColors.softRed,
                            colorText: Colors.red.withOpacity(.7),
                            borderColor: Colors.red,
                          ),
                        ),
                        SizedBox(width: 50.w),
                        Expanded(
                          child: BlocListener<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              print(state);
                              if(state is ProfileUpdateSuccess){
                                context.pop();
                                context.message(message: "success update",color: AppColors.successColor);
                              } else {
                                context.message(message: "loading update",color: AppColors.errorColor);
                              }
                            },
                            child: CustomButton(
                              color: MyTheme.primaryButtonColor,
                              colorText: MyTheme.primaryButtonTextColor,
                              text: "Finish",
                              onPressed: () async {
                                await context
                                    .read<ProfileCubit>()
                                    .updateProfile(
                                      id: id ?? "",
                                      name: nameController.text,
                                      description: aboutController.text,
                                      profileImage: _imageProfile!,
                                      coverImage: _imageCover!,
                                      token: token ?? "",
                                    );
                                // context.pop();
                              },
                            ),
                          ),
                        )
                      ]),
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
