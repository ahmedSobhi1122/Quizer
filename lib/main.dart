import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/notifications/awesome_notifications.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/config/themes/app_theme.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/dependency_injection.dart';
import 'package:themed/themed.dart';
import 'config/routes/router.dart' as router;
import 'core/resources/language_manager.dart';
import 'features/data_sources/local/app_prefs.dart';

late final WidgetsBinding engine;

void main() async {
  // var dio = Dio();
  // RemoteDataSource remoteDataSource = RemoteDataSource(dio);
  // final authRepository = AuthRepositoryImpl(remoteDataSource);
  // final loginUseCase = LoginUserUseCase(authRepository);
  // final registerUseCase = RegisterUserUseCase(authRepository);

  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  engine = WidgetsFlutterBinding.ensureInitialized();
  await init();
  await NotificationsModel.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC1MrvfXPMxvlbzzvHtVEaLw901uQ8uGgA",
      appId: "1:186960525300:android:a9c27f232440f6c4a66ba1",
      messagingSenderId: "186960525300",
      projectId: "quiz-3ce17",
    ),
  );
  await FacebookAuth.instance.webAndDesktopInitialize(
    appId: "544727748098711",
    cookie: true,
    xfbml: true,
    version: "v12.0",
  );
  await EasyLocalization.ensureInitialized();

  // Bloc.observer = MyBlocObserver();

  // await (await SharedPreferences.getInstance()).clear();

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

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    String? theme = sl<AppPrefs>().getString("theme");
    Themed.currentTheme = LightTheme;
    switch (theme) {
      case "LIGHT":
        Themed.currentTheme = LightTheme;
      case "DARK":
        Themed.currentTheme = DarkTheme;
      default:
        // Themed.currentTheme = BlueTheme;
        Themed.currentTheme = DarkTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (sl<AppPrefs>().getBool(KeyPrefs.IS_NOTIFICATON.name) == null ||
        sl<AppPrefs>().getBool(KeyPrefs.IS_NOTIFICATON.name) == true) {
      NotificationsModel.scheduleDailyReminderNotification();
    }


    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        navigatorKey: MyApp.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Quizer',
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        themeMode: ThemeMode.light,
        onGenerateRoute: router.RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      )
    );
  }
}
