import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/extensions.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../common/background.dart';
import 'custom_appbar_points.dart';
import 'custom_appbar_profile.dart';

class CustomHomeAppbar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final int? points;
  final String? rank;
  const
  CustomHomeAppbar({super.key, required this.imageUrl, required this.name, required this.points, required this.rank});

  @override
  Widget build(BuildContext context) {
    return // This Is The Appbar
      Column(
        children: [
          /// AppBar
          Background(
            myhHeight: AppSize.s160.h,
            paddingTop: AppPadding.p38,
            paddingLeft: AppPadding.p24,
            paddingRight: AppPadding.p24,
            colors:  const [
              MyTheme.appbarTop,
              MyTheme.appbarBottom,
              MyTheme.appbarShadow,
            ],
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbarProfile(imageUrl: imageUrl,name: name, rank: rank,isClickable: true,onTap: (){context.pushNamed(Routes.profileScreenRoute);},),
                CustomHomeAppbarPoints(points: points!,),
              ],
            ),
          ),
          /// Blurred Underline
          Container(
            height: AppSize.s12.h,
            decoration:
             BoxDecoration(color: MyTheme.appbarShadow, boxShadow: [
              BoxShadow(
                color: MyTheme.appbarShadow,
                blurRadius: 10.r,
                spreadRadius: 6.r,
                offset: Offset(0, 5.h),
              ),
              const BoxShadow(
                color: MyTheme.appbarShadow,
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
