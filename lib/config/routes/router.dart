import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/home_page.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/create_question_screen.dart';
import 'package:quizer/features/presentation/pages/quiz%20setting%20page/quiz_setting_screen.dart';
import 'package:quizer/features/presentation/pages/setting%20page/setting_screen.dart';

import 'screen_export.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.onbordingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
////////////////////////////////////////////////////////////////////////////////

      ///register
      case Routes.selectionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>.value(
            value: sl<RegisterCubit>(),
            child: const SelectionScreen(),
          ),
        );

      case Routes.dataInfoScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: sl<RegisterCubit>(),
            child: const DataInfoScreen(),
          ),
        );

      case Routes.signUpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>(
            create: (context) => sl<RegisterCubit>(),
            child: const SignUpScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////

      ///login
      case Routes.logInScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: const LoginScreen()),
        );
////////////////////////////////////////////////////////////////////////////////

      ///reset password
      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ForgetPasswordCubit>.value(
            // create: (context) => sl<ForgetPasswordCubit>(),
            value: sl<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );

      case Routes.otpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ForgetPasswordCubit>.value(
            value: sl<ForgetPasswordCubit>(),
            child: const OtpScreen(),
          ),
        );

      case Routes.otpCheckScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ForgetPasswordCubit>.value(
            value: sl<ForgetPasswordCubit>(),
            child: const OtpCheckScreen(),
          ),
        );

      case Routes.newPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ForgetPasswordCubit>.value(
            value: sl<ForgetPasswordCubit>(),
            child: const NewPasswordScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////

      ///home
      case Routes.homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<ProfileCubit>(
          create: (context) => sl<ProfileCubit>(),
          child: const HomePage(),
        ),
      );

      ///profile
      case Routes.profileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>.value(
            value: sl<ProfileCubit>(),
            child: const ProfileScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////

      case Routes.quizSettingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => QuizSettingScreen(),
        );

      case Routes.createQuestionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CreateQuestionScreen(),
        );

      case Routes.settingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }
}
