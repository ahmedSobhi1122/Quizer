import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/category.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/description.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/image_quiz.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/widgets/rate.dart';
class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Math test",
          style: AppTextStyles.statQuizTitleTextStyle(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding.w),
        child: Column(
          children: [
            SizedBox(height: AppSize.s10.h),
            const ImageQuiz(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p32.h),
              child: const DisplayRate(
                rating: 1.5,
              ),
            ),
            const Description(),
            SizedBox(height: AppSize.s32.h),
            const Category(),
            const Spacer(),
            CustomButton(
                color: AppColors.purpleColor,
                colorText: AppColors.whiteColor,
                text: "Start",
                onPressed: () {
                  //TODO : Push To Quiz Screen
                }),
            SizedBox(height: AppSize.s50.h),
          ],
        ),
      ),
    );
  }
}



