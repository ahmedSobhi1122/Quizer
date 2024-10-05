

import 'package:quizer/features/presentation/pages/forget%20password%20pages/forget%20password.dart';

import '../../features/presentation/pages/forget password pages/OtpScreen.dart';
import '../../features/presentation/pages/oboarding pages/onboarding_page.dart';
import 'screen_export.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onbordingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
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

      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case Routes.OtpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => OtpScreen(),
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
