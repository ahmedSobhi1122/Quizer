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

      case Routes.selectionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>.value(
            value: sl<RegisterCubit>(),
            child: const SelectionScreen(),
          ),
        );

      case Routes.dataInfoScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: const DataInfoScreen(),
          ),
        );

      case Routes.signUpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>.value(
            value: sl<RegisterCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.logInScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: const LoginScreen()),
        );

      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>.value(
            value: sl<LoginCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );

      case Routes.otpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>.value(
            value: sl<LoginCubit>(),
            child: const OtpScreen(),
          ),
        );

      case Routes.otpCheckScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>.value(
            value: sl<LoginCubit>(),
            child: const OtpCheckScreen(),
          ),
        );

      case Routes.newPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>.value(
            value: sl<LoginCubit>(),
            child: const NewPasswordScreen(),
          ),
        );

      case Routes.profileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
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
