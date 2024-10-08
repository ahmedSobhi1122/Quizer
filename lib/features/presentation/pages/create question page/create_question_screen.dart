import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';

import '../../../../config/routes/route_constants.dart';
import '../../common/button_back.dart';
import '../../common/custom_button_with_shadow.dart';
import '../../common/custom_progress.dart';

class CreateQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Background(
          paddingRight: AppSize.s10,
          paddingLeft: AppSize.s10,
          paddingTop: AppSize.s20,
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomButtonBack(
                          onPressed: () => context
                              .pushReplacementNamed(Routes.quizSettingScreenRoute),
                        ),
                        SizedBox(
                          width: AppSize.s28.w,
                        ),
                        const CustomProgress(
                          start: 0,
                          end: 3,
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        "Question Data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.s22.sp,
                          color: AppColors.blackColor80,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor40,
                          fontSize: AppSize.s20,
                        ),
                        decoration: InputDecoration(
                          hintText: "Question description like\nWhat is your name ?",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor40,
                            fontSize: AppSize.s28,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "250/500",
                          style: TextStyle(
                              color: Colors.grey[700], fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    ImageUploadField(height: 100.h,hint: "Question image!",),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Quiz Title",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor40,
                          fontSize: AppSize.s16,
                        ),
                        fillColor: Colors.white60,
                        suffixIcon: Icon(
                          Icons.title,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "20/30",
                          style: TextStyle(
                              color: Colors.grey[700], fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s20.h,
                    ),
                    CustomButton(
                      color: AppColors.purpleColor,
                      colorText: AppColors.whiteColor,
                      text: "Add answer",
                      onPressed: () {

                      },
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomButton(
                          text: "Add More",
                          onPressed: () {context.pop();},
                          color: AppColors.lightPurpleColor.withOpacity(.7),
                          colorText: AppColors.purpleColor,
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

                          },
                        ),
                      )
                    ])
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
