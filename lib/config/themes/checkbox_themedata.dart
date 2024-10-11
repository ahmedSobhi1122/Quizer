
import 'package:flutter/material.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';


CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  checkColor: WidgetStateProperty.all(Colors.white),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(AppBorderRadius.defaultBorderRadius / 2),
    ),
  ),
  side: const BorderSide(color: AppColors.whiteColor40),
);
