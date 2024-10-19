import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/image_upload.dart';
import 'package:quizer/features/presentation/common/drop_list.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';

import '../../../../config/themes/theme.dart';

class QuizSettingScreen extends StatefulWidget {
  @override
  State<QuizSettingScreen> createState() => _QuizSettingScreenState();
}

class _QuizSettingScreenState extends State<QuizSettingScreen> {
  final List<int> _times = [5, 10, 15, 20, 25, 30,];
  final List<String> _category = ['football', 'science', 'math', 'history', 'geography'];
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = -1;





  File? _image;
  final ImagePicker _picker = ImagePicker();

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
          color: _selectedIndex == index ? MyTheme.backgroundColor1 : MyTheme.disabledColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _selectedIndex == index ? MyTheme.selectedBorder : Colors.grey,
            width: 2,
          )
        ),
        child: Center(
          child: Text(
            "${_times[index%_times.length]}",
            style: const TextStyle(
              color: MyTheme.textColor,
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
                      color: MyTheme.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Container(
                  height: 200.h,
                  child: ImageUploadField(
                    // height: 200.h,
                    hint: "Quiz Image!",
                    fitter: BoxFit.contain,
                    onImageSelected: () async {
                      final pickedFile = await _picker.pickImage(
                          source: ImageSource.gallery);

                      if (pickedFile != null) {
                        setState(() {
                          _image = File(pickedFile.path);
                        });
                      }
                    },
                    image: _image,
                  ),
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
                  maxLength: 30,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.textColor,
                    fontSize: AppSize.s16,
                  ),
                  decoration: InputDecoration(
                    labelText: "Quiz Title",
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.textColor,
                      fontSize: AppSize.s16,
                    ),
                    counterStyle: TextStyle(
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.bold
                    ),
                    fillColor: Colors.white60,
                    suffixIcon: Icon(
                      Icons.title,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "Quiz time (minute)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.textColor,
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
                      color: MyTheme.textColor.withOpacity(.3),

                    ),
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _times.length,
                      itemBuilder: (context, index) =>timeItem(index % _times.length),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                const TextField(
                  maxLength: 500,
                  maxLines: 5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.textColor,
                    fontSize: AppSize.s16,
                  ),
                  decoration: InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white60,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.textColor,
                      fontSize: AppSize.s16,
                    ),
                    counterStyle: TextStyle(
                        color: MyTheme.textColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
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


