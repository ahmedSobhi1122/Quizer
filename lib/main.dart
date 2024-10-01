import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quizer',
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        themeMode: ThemeMode.light,
        onGenerateRoute: router.RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
