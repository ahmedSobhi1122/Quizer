import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/text_styles.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';

class CustomHomeCategories extends StatelessWidget {
  // TODO Add Categories ListView --- left till we decide the category items shape
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s104.h,
      width: AppSize.s382.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.br16)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: context.width / 5,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.cyclone_outlined,
            size: 32,
            color: AppColors.purpleColor50,
          ),
          Text(
            "Technology",
            style: AppTextStyles.homeCategoryTextStyle(context),
          )
        ],
      ),
    );
  }
}
