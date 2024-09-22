import 'screen_export.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashScreen(),
      //   );
    //   // case onbordingScreenRoute:
    //   //   return MaterialPageRoute(
    //   //     builder: (context) => const OnBoardingScreen(),
    //   //   );
    //   case Routes.logInScreenRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => LoginScreen(),
    //     );
    //   case Routes.passwordScreenRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => PasswordScreen(),
    //     );
    //   // case signUpScreenRoute:
    //   //   return MaterialPageRoute(
    //   //     builder: (context) => const SignUpScreen(),
    //   //   );
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
