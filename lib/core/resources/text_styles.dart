
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';
import 'language_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  ///TextField
  static TextStyle textStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f20,
      );


  ///Button


  static TextStyle customButtonTextStyle(BuildContext context,Color color) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color,
        fontSize: FontSize.f20,
      );

  ///Selection
  static TextStyle headerSignupTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f28,
      );

  static TextStyle subHeaderSignupTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor.withOpacity(.5),
        fontSize: FontSize.f18,
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
