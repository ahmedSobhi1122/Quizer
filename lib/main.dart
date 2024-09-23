import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes/route_constants.dart';
import 'config/routes/router.dart' as router;
import 'config/themes/app_theme.dart';
import 'core/resources/language_manager.dart';

late final WidgetsBinding engine;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);

  engine = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Bloc.observer = MyBlocObserver();

  // await (await SharedPreferences.getInstance()).clear();
  await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: AppLanguages.locals,
      path: AppLanguages.translationsPath,
      fallbackLocale: AppLanguages.fallBackLocal,
      startLocale: AppLanguages.startLocal,
      useOnlyLangCode: true,
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparentColor, // Set status bar color (transparent in this case)
        statusBarBrightness: Brightness.light, // Set the status bar brightness (light/dark background)
        statusBarIconBrightness: Brightness.dark, // Set the status bar icon color (light/dark icons)
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizer',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: router.RouteGenerator.getRoute,
      initialRoute: Routes.signUpScreenRoute,
    );
  }
}
