

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dependency_injection.dart';
import '../../features/presentation/cubit/login_cubit.dart';
import '../../features/presentation/pages/forget password pages/Otp check.dart';
import '../../features/presentation/pages/forget password pages/OtpScreen.dart';
import '../../features/presentation/pages/forget password pages/forget password.dart';
import '../../features/presentation/pages/forget password pages/new password.dart';
import '../../features/presentation/pages/profile page/profile_screen.dart';
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
      case Routes.logInScreenRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>  LoginCubit(sl()),
                child: const LoginScreen()),
        );
    case Routes.dataInfoScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const DataInfoScreen(),
      );
      case Routes.profileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.otpcheckScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>  OtpCheckScreen(),
        );
      case Routes.NewPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>  NewPasswordScreen(),
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
