import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/dependency_injection.dart';
import 'config/routes/router.dart' as router;
import 'config/themes/app_theme.dart';
import 'core/resources/language_manager.dart';

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
        initialRoute: Routes.forgetPasswordScreenRoute,
      ),
    );
  }
}
