import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../common/custom_progress.dart';

class CustomDailyTask extends StatelessWidget {
  const CustomDailyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s390.w,
      height: AppSize.s130.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           DailyImage(),
           DailyContent()
        ],
      ),
    );
  }
}



// Daily Image Custom Widget
class DailyImage extends StatelessWidget {
  const DailyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppBorderRadius.br16),
        bottomLeft: Radius.circular(AppBorderRadius.br16),
      ), // Match the radius you want
      child: SizedBox(
        width: AppSize.s120.w,  // Set width as needed
        height: AppSize.s130.h, // Set height as needed
        child: Image.asset(
          ImageAssets.cringe,
          fit: BoxFit.cover, // Ensures the image covers the container
        ),
      ),
    );
  }
}

// Daily Content Custom Widget
class DailyContent extends StatelessWidget {
  const DailyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: AppPadding.p8.h, right: AppPadding.p10.w,left: AppPadding.p10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Task",
            style:
            AppTextStyles.homeDailyTaskHeaderTextStyle(
                context),
          ),
          Text("Solve 16 Question!",style: AppTextStyles.homeDailyTaskTitleTextStyle(context),),
          SizedBox(height: AppSize.s24.h),
          CustomProgress(
            start: 0,
            end: 2,
            borderColor: AppColors.transparentColor,
            backgroundColor:
            AppColors.orangeAccent.withOpacity(0.5),
            foregroundGradientColors: const [
              AppColors.orangeAccent,
              AppColors.orange
            ],
          ),
          SizedBox(height: AppSize.s4.h),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Progress",style: AppTextStyles.homeDailyTaskSubTitleTextStyle(context),),
                SizedBox(width: AppSize.s145.w),
                Text("8 / 16",style: AppTextStyles.homeDailyTaskSubTitleTextStyle(context),),
              ],
            ),
        ],
      ),
    );
  }
}


