
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';
import 'language_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  ///TextField


  ///Button

  static TextStyle customButtonTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.purpleColor,
        fontSize: FontSize.f20,
      );

  ///Selection
  static TextStyle headerTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f32,
      );

  static TextStyle selectedBoxTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f32,
      );

  ///Login


  ///Password

}
