

import 'screen_export.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.selectionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SelectionScreen(),
        );
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
            builder: (context) =>const SplashScreen(),
        );
      case Routes.signUpScreenRoute:
        return MaterialPageRoute(
            builder: (context) =>const SignUpScreen(),
        );
    case Routes.dataInfoScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const DataInfoScreen(),
      );
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
