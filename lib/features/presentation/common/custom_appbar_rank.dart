// Custom AppBar Rank
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/screen_export.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/resources/text_styles.dart';

class CustomAppBarRank extends StatelessWidget {
  const CustomAppBarRank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange.withOpacity(0.1),
        border: Border.all(color: AppColors.orange),
        borderRadius: BorderRadius.circular(AppBorderRadius.br100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p2.h,horizontal: AppPadding.p12.w),
        child: Text("Newbie", style: AppTextStyles.homeRankTextStyle(context)),
      ),
    );
  }
}