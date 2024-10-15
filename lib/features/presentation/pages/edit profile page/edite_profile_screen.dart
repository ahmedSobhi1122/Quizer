import 'package:flutter/material.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/app_fonts.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/assets_manager.dart';

import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_appbar_rank.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';

import '../../common/custom_button_with_shadow.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _userName = "Ahmed Mohsen";

  String _aboutMe = "A brief description of Jackson Logan as a UI/UX designer, emphasizing his experience in creating visually appealing and functional designs. It mentions his interest in a variety of design and programming tools.";

  String _profileImage = ImageAssets.avatar;

  String _coverImage = ImageAssets.profile;

  final nameController = TextEditingController();

  final aboutController = TextEditingController();

  @override
  void initState() {
    nameController.text = _userName;
    aboutController.text = _aboutMe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
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
                      child: ImageUploadField(fitter: BoxFit.cover,defualtImage: _coverImage,),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                    child: ImageUploadField(fitter: BoxFit.cover,defualtImage: _profileImage,)
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
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: FontSize.f24,
                          color: AppColors.blackColor80,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Container(
                      height: 70.h,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: FontSize.f18,
                            color: AppColors.blackColor80,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: FontSize.f24,
                          color: AppColors.blackColor80,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      height: 200.h,
                      child: TextField(
                        controller: aboutController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLines: 15,
                        style: TextStyle(
                            fontSize: FontSize.f18,
                            color: AppColors.blackColor80,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      height: 180.h,
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
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: CustomButton(
                            color: AppColors.purpleColor,
                            colorText: AppColors.whiteColor,
                            text: "Finish",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ]
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
