import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/text_styles.dart';

class CustomHomeAppbarPoints extends StatelessWidget {
  final int points;
  const CustomHomeAppbarPoints({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s110.w,
      height: AppSize.s50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.br100),
        border: Border.all(
          color: AppColors.whiteColor.withOpacity(0.8),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(SVGAssets.lightning),
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p8.w),
            child: Text("$points",
              style: AppTextStyles.homePointsTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}