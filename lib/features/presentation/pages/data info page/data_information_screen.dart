import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';

class DataInfoScreen extends StatelessWidget {
  const DataInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: context.width,
      height: context.height,
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
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              const CustomButtonBack(),
              SizedBox(
                width: AppSize.s28.w,
              ),
              const CustomProgress(
                progress: 2,
              ),
            ],
          ),
          SizedBox(height: AppSize.s60.h),
          Text(
            '''Create an account ✏️''',
            style: AppTextStyles.headerSignupTextStyle(context),
          ),
          SizedBox(height: AppSize.s16.h),
          Text(
            '''Please complete your profile''',
            style: AppTextStyles.subHeaderSignupTextStyle(context),
          ),
          SizedBox(height: AppSize.s90.h),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: AppSize.s150.w,
              height: AppSize.s50.h,
              child: TextField(
                decoration: style("First Name"),
                style: AppTextStyles.textStyle(context),
              ),
            ),
            SizedBox(width: AppSize.s36.w),
            SizedBox(
              width: AppSize.s150.w,
              height: AppSize.s50.h,
              child: TextField(
                decoration:  style("Last Name"),
                style: AppTextStyles.textStyle(context),
              ),
            ),
          ]),
          SizedBox(height: AppSize.s32.h),
          SizedBox(
            width: AppSize.s335.w,
            height: AppSize.s50.h,
            child: const DateOfBirth(),
          ),
          SizedBox(height: AppSize.s32.h),
          SizedBox(
            width: AppSize.s335.w,
            height: AppSize.s50.h,
            child: TextField(
              decoration: style("Phone Number"),
              keyboardType: TextInputType.phone,
              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: AppSize.s230.h),
          CustomButton(
            color: AppColors.lightPurpleColor.withOpacity(.7),
            colorText: AppColors.purpleColor,
            text: "Next",
            onPressed: () =>context.pushNamed(Routes.signUpScreenRoute),
          ),
        ]),
      ),
    ));
  }
}
