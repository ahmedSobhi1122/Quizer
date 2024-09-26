import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';
import 'package:quizer/features/presentation/pages/selection%20page/widget/selected_container.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          top: AppPadding.p50.h,
          right: AppPadding.p24.w,
          left: AppPadding.p24.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.purpleColor50,
          AppColors.purpleColor30,
          AppColors.purpleColor10,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(children: [
        Row(
          children: [
            const CustomButtonBack(),
            SizedBox(
              width: AppSize.s28.w,
            ),
            const CustomProgress(
              progress: 3,
            ),
          ],
        ),
        SizedBox(height: AppSize.s60.h),
        Text(
          '''What type of account would you like to create? ''',
          style: AppTextStyles.headerSignupTextStyle(context),
        ),
        SizedBox(height: AppSize.s60.h),
        const Selection(),
        SizedBox(height: AppSize.s226.h,),
        CustomButton(
          color: AppColors.lightPurpleColor.withOpacity(.7),
          colorText: AppColors.purpleColor,
          text: "Next",
          onPressed: () => context.pushNamed(Routes.dataInfoScreenRoute),
        ),
      ]),
    ));
  }
}

