import 'package:flutter/material.dart';
import 'package:quizer/config/themes/theme.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';
import 'language_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  ///TextField
  static TextStyle textStyle(BuildContext context) => getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f20,
      );

  ///Button
  static TextStyle customButtonTextStyle(BuildContext context,
          {Color? color}) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? AppColors.blackColor,
        fontSize: FontSize.f22,
      );

  static TextStyle socialButtonTextStyle(BuildContext context,
          {Color? color}) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? AppColors.blackColor,
        fontSize: FontSize.f14,
      );

  ///Selection
  static TextStyle headerSignupTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f28,
      );

  static TextStyle subHeaderSignupTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor.withOpacity(.5),
        fontSize: FontSize.f18,
      );

  static TextStyle selectedBoxTextStyle(BuildContext context, Color color) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color,
        fontSize: FontSize.f32,
      );

  ///SignUp
  static TextStyle rememberMeTextStyle(BuildContext context) => getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f14,
      );

  static TextStyle orTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.greyColor,
        fontSize: FontSize.f14,
      );

  ///Login
  static TextStyle forgotPasswordTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.purpleColor,
        fontSize: FontSize.f14,
      );

  ///otp
  static TextStyle otpTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f32,
      );

  static TextStyle otpTextFieldTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f24,
      );

  ///home
  static TextStyle homeNameTextStyle(BuildContext context) => getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f16,
      );

  static TextStyle homeRankTextStyle(BuildContext context) => getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f11,
      );

  static TextStyle homePointsTextStyle(BuildContext context) => getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f14,
      );

  static TextStyle homeDailyTaskHeaderTextStyle(BuildContext context) =>
      getBlackStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f20,
      );

  static TextStyle homeDailyTaskTitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f16,
      );

  static TextStyle homeDailyTaskSubTitleTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f14,
      );

  static TextStyle homeTitlesTextStyle(BuildContext context) => getBlackStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f14,
      );

  static TextStyle homeSubTitlesTextStyle(BuildContext context) =>
      getBlackStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.deepDarkPurple,
        fontSize: FontSize.f14,
      );

  static TextStyle homeGameCardTitleTextStyle(BuildContext context) =>
      getBlackStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f10,
      );
  static TextStyle homeCategoryTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: MyTheme.textColor,
        fontSize: FontSize.f12,
      );
  static TextStyle leaderBoardCardTitleTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,

        fontSize: FontSize.f18,
      );
  static TextStyle leaderBoardCardSubtitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,

        fontSize: FontSize.f10,
      );
  static TextStyle leaderBoardRanktitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,

        fontSize: FontSize.f10,
      );
  static TextStyle leaderBoardRankSubtitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,

        fontSize: FontSize.f8,
      );

  ///Start quiz
  static TextStyle statQuizTitleTextStyle(BuildContext context) =>
      getBlackStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f32,
      );

  static TextStyle statQuizTitleSectionTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f32,
      );

  static TextStyle statQuizSubtitleSectionTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.greyColor,
        fontSize: FontSize.f16,
      );

  static TextStyle statQuizTitleInformationTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f20,
      );

  static TextStyle statQuizInformationTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.purpleColor,
        fontSize: FontSize.f18,
      );
  static TextStyle statQuizNameTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.whiteColor,
        fontSize: FontSize.f14,
      );
  static TextStyle statQuizNumberTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: AppColors.blackColor,
        fontSize: FontSize.f10,
      );
}
