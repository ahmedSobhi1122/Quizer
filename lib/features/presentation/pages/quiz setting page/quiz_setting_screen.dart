import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/common/drop_list.dart';

import '../../../../config/routes/route_constants.dart';
import '../../common/custom_button_with_shadow.dart';

class QuizSettingScreen extends StatelessWidget {
  const QuizSettingScreen({super.key});

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
                Center(
                  child: Text(
                    "Quiz Info",
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
                const ImageUploadField(height: 200,hint: "Quiz Image!",fitter: BoxFit.contain,),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                const CustomDropdown(
                  items: [
                    "Category 1",
                    "Category 2",
                    "Category 3",
                    "Category 4",
                    "Category 5",
                    "Category 6",
                    "Category 7",
                    "Category 8",
                    "Category 9",
                    "Category 10",
                    "Category 11",
                    "Category 12",
                    "Category 13",
                    "Category 14",
                    "Category 15",
                    "Category 16",
                    "Category 17",
                    "Category 18",
                    "Category 19",
                    "Category 20",
                    "Category 21",
                    "Category 22",
                    "Category 23",
                    "Category 24",
                  ],
                  hint: "Select Quiz Category",
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                TextField(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor40,
                    fontSize: AppSize.s16,
                  ),
                  decoration: InputDecoration(
                    labelText: "Quiz Title",
                    labelStyle: const TextStyle(
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
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const TextField(
                    maxLines: null,
                    expands: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor40,
                      fontSize: AppSize.s16,
                    ),
                    decoration: InputDecoration(
                      labelText: "Description",
                      fillColor: Colors.white30,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor40,
                        fontSize: AppSize.s16,
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
                  height: AppSize.s50.h,
                ),
                Row(children: [
                  Expanded(
                      child: CustomButton(
                          text: "Cancel",
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
                      text: "Next",
                      onPressed: () {
                        context.pushReplacementNamed(Routes.createQuestionScreenRoute);
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
