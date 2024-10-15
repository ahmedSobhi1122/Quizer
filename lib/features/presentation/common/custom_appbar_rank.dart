// Custom AppBar Rank
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/screen_export.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/resources/text_styles.dart';

class CustomAppBarRank extends StatelessWidget {
  final String? rank;
  const CustomAppBarRank({super.key, required this.rank});

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
        child: Text(rank!, style: AppTextStyles.homeRankTextStyle(context)),
      ),
    );
  }
}