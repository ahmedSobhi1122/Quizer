import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_values.dart';

class CustomButtonBack extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButtonBack({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back_rounded,size: AppSize.s24.r,),
    );
  }
}
