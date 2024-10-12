import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../common/background.dart';
import 'custom_appbar_points.dart';
import 'custom_appbar_profile.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return // This Is The Appbar
      Column(
        children: [
          Background(
            myhHeight: AppSize.s160.h,
            paddingTop: AppPadding.p38,
            paddingLeft: AppPadding.p24,
            paddingRight: AppPadding.p24,
            colors: const [
              AppColors.appbar_top,
              AppColors.appbar_bottom,
              AppColors.under_appbar_shadow,
            ],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbarProfile(),
                CustomHomeAppbarPoints(),
              ],
            ),
          ),
          Container(
            height: AppSize.s12.h,
            decoration:
            const BoxDecoration(color: AppColors.under_appbar_shadow, boxShadow: [
              BoxShadow(
                color: AppColors.under_appbar_shadow,
                blurRadius: 10,
                spreadRadius: 6,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: AppColors.under_appbar_shadow,
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(0, 5),
              ),
            ]),
          )
        ],
      );
  }
}
