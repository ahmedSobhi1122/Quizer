import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../core/resources/app_values.dart';

class CustomHomeCategories extends StatelessWidget { // TODO Add Categories ListView --- left till we decide the category items shape
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s104.h,
      width: AppSize.s382.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.br16)
      ),
      child: ListView.builder(scrollDirection: Axis.horizontal,itemExtent: context.width/5, itemCount: 5, itemBuilder: (context, index) {

            return const Placeholder();
          },),
    );
  }
}
