import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomButtonBack extends StatelessWidget {
  const CustomButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: Icon(Icons.arrow_back_rounded,size: AppSize.s24.r,),
    );
  }
}
