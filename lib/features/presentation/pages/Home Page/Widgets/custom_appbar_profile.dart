// Custom AppBar Profile
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../common/custom_appbar_rank.dart';

class CustomAppbarProfile extends StatelessWidget {
  final bool? isClickable;
  final void Function()? onTap;
  const CustomAppbarProfile({super.key, this.isClickable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Circular Avatar with border
        InkWell(
        onTap: isClickable == true ? onTap : () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.whiteColor.withOpacity(0.80),
                width: AppSize.s2.r,
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.all(AppPadding.p8.r),
              child:  FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: AppSize.s30.r,
                  backgroundColor: AppColors.warningColor,
                  backgroundImage: const AssetImage('assets/images/avatar.png'), // TODO change Image
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppPadding.p12.h),
                child: Text("Ahmed Mohsen",style: AppTextStyles.homeNameTextStyle(context),),
              ),
              const CustomAppBarRank(),
            ],
          ),),
      ],
    );
  }
}

