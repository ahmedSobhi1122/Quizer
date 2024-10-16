// Custom AppBar Profile
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/image_handler.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../common/custom_appbar_rank.dart';

class CustomAppbarProfile extends StatelessWidget {
  final bool? isClickable;
  final String? imageUrl;
  final String? name;
  final String? rank;
  final void Function()? onTap;

  const CustomAppbarProfile(
      {super.key, this.isClickable, this.onTap, required this.imageUrl, required this.name, required this.rank});

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
              padding: EdgeInsets.all(AppPadding.p8.r),
              child: FittedBox(
                fit: BoxFit.contain,
                child: ImageManager(
                  width: AppSize.s60.r,
                  url: imageUrl!,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppPadding.p12.h),
                child: Text(
                  name!,
                  style: AppTextStyles.homeNameTextStyle(context),
                ),
              ),
               CustomAppBarRank(rank: rank,),
            ],
          ),
        ),
      ],
    );
  }
}
