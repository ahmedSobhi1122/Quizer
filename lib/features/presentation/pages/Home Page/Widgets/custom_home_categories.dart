import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/text_styles.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_values.dart';
import '../../../../domain/entities/category.dart';

class CustomHomeCategories extends StatelessWidget {
  // TODO Add Categories ListView --- left till we decide the category items shape
  final List<Category> categories;
  const CustomHomeCategories({super.key,  this.categories = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s104.h,
      width: AppSize.s382.w,
      decoration: BoxDecoration(
          color: MyTheme.contentCardBG,
          borderRadius: BorderRadius.circular(AppBorderRadius.br16)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: context.width / 5,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

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
            category.name!,
            style: AppTextStyles.homeCategoryTextStyle(context),
          )
        ],
      ),
    );
  }
}
