import 'package:quizer/features/presentation/cubit/create_question_answers_cubit.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_profile_cubit.dart';
import 'package:quizer/features/presentation/cubit/leaderboard_cubit.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/cubit/setting_cubit.dart';
import 'package:quizer/features/presentation/cubit/start_quiz_cubit.dart';
import 'package:quizer/features/presentation/pages/Home%20Page/home_page.dart';
import 'package:quizer/features/presentation/pages/category%20page/category_screen.dart';
import 'package:quizer/features/presentation/pages/chat%20bot%20Page/chat_bot_screen.dart';
import 'package:quizer/features/presentation/pages/create%20question%20page/create_question_screen.dart';
import 'package:quizer/features/presentation/pages/edit%20profile%20page/edite_profile_screen.dart';
import 'package:quizer/features/presentation/pages/entry%20point/entry_screen.dart';
import 'package:quizer/features/presentation/pages/quiz%20setting%20page/quiz_setting_screen.dart';
import 'package:quizer/features/presentation/pages/setting%20page/setting_screen.dart';
import 'package:quizer/features/presentation/pages/start%20quiz%20page/start_quiz_screen.dart';

import '../../features/presentation/cubit/game_cubit.dart';
import '../../features/presentation/cubit/question_create_cubit.dart';
import '../../features/presentation/cubit/upload_image_cubit.dart';
import '../../features/presentation/pages/game page/game_screen.dart';
import '../../features/presentation/pages/leadboard page/leadboard_page.dart';
import '../../features/presentation/cubit/home_categories_cubit.dart';
import '../../features/presentation/cubit/home_quizzes_cubit.dart';
import 'screen_export.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.onboardingScreenRoute:
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
          builder: (context) => BlocProvider(
            create: (context) => sl<RegisterCubit>(),
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

      /// Home
      case Routes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeProfileCubit>(
                create: (context) => sl<HomeProfileCubit>(),
              ),
              BlocProvider<HomeQuizzesCubit>(
                create: (context) => sl<HomeQuizzesCubit>(),
              ),
              BlocProvider<HomeCategoriesCubit>(
                create: (context) => sl<HomeCategoriesCubit>(),
              ),
            ],
            child: const HomePage(),
          ),
        );

////////////////////////////////////////////////////////////////////////////////
      ///profile
      case Routes.profileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>(
            create: (context) => sl<ProfileCubit>(),
            child: const ProfileScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////
      ///Start Quiz
      case Routes.startQuizScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<StartQuizCubit>(
            create: (context) => sl<StartQuizCubit>(),
            child: const StartQuizScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////
    ///Quiz Game TODO - change cubit here
      case Routes.gameScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<GameCubit>(
            create: (context) =>  sl<GameCubit>(),
            child: const GameScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////

      case Routes.quizSettingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => QuizSettingScreen(),
        );

////////////////////////////////////////////////////////////////////////////////

      case Routes.chatScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ChatBotScreen(),
        );

////////////////////////////////////////////////////////////////////////////////
      case Routes.createQuestionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
            BlocProvider<QuestionCubit>(
                create: (context) => sl<QuestionCubit>()),
            BlocProvider<CreateQuestionAnswersCubit>(
                create: (context) => sl<CreateQuestionAnswersCubit>()),
              BlocProvider<UploadImageCubit>(
                  create: (context) => sl<UploadImageCubit>()),

            ],
              child: CreateQuestionScreen(),
          )
        );

////////////////////////////////////////////////////////////////////////////////
      ///leaderBoard
      case Routes.leaderBoardScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LeaderboardCubit>(
            create: (context) => sl<LeaderboardCubit>(),
            child: const LeaderBoardScreen(),
          ),
        );

////////////////////////////////////////////////////////////////////////////////
      case Routes.createQuestionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CreateQuestionScreen(),
        );

////////////////////////////////////////////////////////////////////////////////
      ///setting
      case Routes.settingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SettingCubit>(
            create: (context) => sl<SettingCubit>(),
            child: const SettingScreen(),
          ),
        );

////////////////////////////////////////////////////////////////////////////////
      ///edit profile
      case Routes.editProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileCubit>(
            create: (context) => sl<ProfileCubit>(),
            child: const EditProfileScreen(),
          ),
        );
////////////////////////////////////////////////////////////////////////////////

      case Routes.categoryScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case Routes.MainScreenRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<SettingCubit>(
                create: (context) => sl<SettingCubit>(),
              ),
              BlocProvider<HomeProfileCubit>(
                create: (context) => sl<HomeProfileCubit>(),
              ),
              BlocProvider<HomeQuizzesCubit>(
                create: (context) => sl<HomeQuizzesCubit>(),
              ),
              BlocProvider<HomeCategoriesCubit>(
                create: (context) => sl<HomeCategoriesCubit>(),
              ),
              BlocProvider<ProfileCubit>(
                create: (context) => sl<ProfileCubit>(),
              ),
              BlocProvider<LeaderboardCubit>(
                create: (context) => sl<LeaderboardCubit>(),
              ),
            ],
              child: MainScreen()
          ),
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
