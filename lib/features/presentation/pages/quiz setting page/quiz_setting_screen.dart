import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/common/drop_list.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';

class QuizSettingScreen extends StatefulWidget {
  @override
  State<QuizSettingScreen> createState() => _QuizSettingScreenState();
}

class _QuizSettingScreenState extends State<QuizSettingScreen> {
  final List<int> _times = [5, 10, 15, 20, 25, 30,];
  final List<String> _category = ['football', 'science', 'math', 'history', 'geography'];
  int _selectedIndex = -1;
  Widget timeItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 50.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? AppColors.darkPurpleColor10 : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _selectedIndex == index ? AppColors.lightPurpleColor : Colors.grey,
            width: 2,
          )
        ),
        child: Center(
          child: Text(
            "${_times[index%_times.length]}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSize.s20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

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
            padding: const EdgeInsets.all(AppPadding.p8),
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
                ImageUploadField(
                  height: 200.h,
                  hint: "Quiz Image!",
                  fitter: BoxFit.contain,
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                CustomDropdown(
                  items: _category,
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
                Text(
                    "Quiz time (minute)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: AppSize.s16
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Center(
                  child: Container(
                    height: 50.w,
                    width: 325.w,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p5,vertical: AppPadding.p5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.black12,

                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _times.length * 1000,
                      itemBuilder: (context, index) =>timeItem(index % _times.length),
                    ),
                  ),
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
                      onPressed: () {
                        context.pop();
                      },
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
                        context.pushReplacementNamed(
                            Routes.createQuestionScreenRoute);
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


