
import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';
import 'button_theme.dart';
import 'checkbox_themedata.dart';
import 'input_decoration_theme.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.purpleColor50,
        secondary: AppColors.purpleColor30,
        tertiary: AppColors.purpleColor10,
      ),
      brightness: Brightness.light,
      // fontFamily: "Plus Jakarta",
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }

}
