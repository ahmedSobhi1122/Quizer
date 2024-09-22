
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';
import 'language_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  ///TextField

  static TextStyle hintTextFieldTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.greyColor,
        fontSize: FontSize.f16,
      );

  ///Button

  static TextStyle customButtonTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f22,
      );

  static TextStyle cancelTextStyle(BuildContext context) => getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blueColor,
        fontSize: FontSize.f22,
      );

  ///Login

  static TextStyle loginHeaderTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f50,
      );

  static TextStyle loginSubHeaderTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f20,
      );

  static TextStyle loginOrTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blueColor,
        fontSize: FontSize.f16,
      );

  ///Password
  static TextStyle passwordHelloTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blueColor,
        fontSize: FontSize.f32,
      );

  static TextStyle passwordTextStyle(BuildContext context) => getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blueColor,
        fontSize: FontSize.f18,
      );

  static TextStyle forgotPasswordTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blueColor,
        fontSize: FontSize.f14,
      );
}
