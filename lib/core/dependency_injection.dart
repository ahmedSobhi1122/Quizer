import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizer/core/helper/dio_factory.dart';
import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';
import 'package:quizer/features/data_sources/repository_impl/account_repository.dart';
import 'package:quizer/features/data_sources/repository_impl/auth_repository.dart';
import 'package:quizer/features/data_sources/repository_impl/quiz_repository.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';
import 'package:quizer/features/domain/repository/quiz_repository.dart';
import 'package:quizer/features/domain/usecases/create_quiz_usecase.dart';
import 'package:quizer/features/domain/usecases/facebook_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/get_categories_usecase.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';
import 'package:quizer/features/domain/usecases/get_home_quizzes_usecase.dart';
import 'package:quizer/features/domain/usecases/get_otp_usecase.dart';
import 'package:quizer/features/domain/usecases/get_profile_data_usecase.dart';
import 'package:quizer/features/domain/usecases/get_quiz_usecase.dart';
import 'package:quizer/features/domain/usecases/google_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/leaderboard_usecase.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/domain/usecases/otp_profile_usecase.dart';
import 'package:quizer/features/domain/usecases/register_usecase.dart';
import 'package:quizer/features/domain/usecases/reset_password_usecase.dart';
import 'package:quizer/features/domain/usecases/select_answer_usercase.dart';
import 'package:quizer/features/domain/usecases/update_profile_usecase.dart';
import 'package:quizer/features/domain/usecases/user_exist_usecase.dart';
import 'package:quizer/features/domain/usecases/verify_otp_usecase.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/cubit/game_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_categories_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_profile_cubit.dart';
import 'package:quizer/features/presentation/cubit/home_quizzes_cubit.dart';
import 'package:quizer/features/presentation/cubit/leaderboard_cubit.dart';
import 'package:quizer/features/presentation/cubit/login_cubit.dart';
import 'package:quizer/features/presentation/cubit/profile_cubit.dart';
import 'package:quizer/features/presentation/cubit/question_create_cubit.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/cubit/setting_cubit.dart';
import 'package:quizer/features/presentation/cubit/start_quiz_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/domain/usecases/delete_account_usecase.dart';
import '../features/presentation/cubit/create_question_answers_cubit.dart';
import '../features/presentation/cubit/upload_image_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);

  /// Repositories
  sl.registerLazySingleton<AppPrefs>(() => AppPrefsImpl(sharedPreferences));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl()));
  sl.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl(sl()));

  /// UseCases
  sl.registerLazySingleton<GetProfileDataUseCase>(() => GetProfileDataUseCase(sl()));
  sl.registerLazySingleton<GetHomeProfileUseCase>(() => GetHomeProfileUseCase(sl()));
  sl.registerLazySingleton<GetHomeQuizzesUseCase>(() => GetHomeQuizzesUseCase(sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton<SelectAnswerUseCase>(() => SelectAnswerUseCase());
  sl.registerLazySingleton<GetQuizUseCase>(() => GetQuizUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<GetOTPUseCase>(() => GetOTPUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton<UserExistUseCase>(() => UserExistUseCase(sl()));
  sl.registerLazySingleton<GoogleAuthUseCase>(() => GoogleAuthUseCase(sl()));
  sl.registerLazySingleton<FacebookAuthUseCase>(() => FacebookAuthUseCase(sl()));
  sl.registerLazySingleton<OtpProfileUseCase>(() => OtpProfileUseCase(sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton<UpdateProfileUsecase>(() => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton<LeaderboardUsecase>(() => LeaderboardUsecase(sl()));
  sl.registerLazySingleton<DeleteAccountUsecase>(() => DeleteAccountUsecase(sl()));
  sl.registerLazySingleton<CreateQuizUseCase>(() => CreateQuizUseCase(sl()));

  /// Cubits
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl(),sl(),sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl(),sl(),sl(),sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl(),sl()));
  sl.registerFactory<LeaderboardCubit>(() => LeaderboardCubit(sl()));
  sl.registerFactory<HomeProfileCubit>(() => HomeProfileCubit(sl()));
  sl.registerLazySingleton<StartQuizCubit>(() => StartQuizCubit(sl()));
  sl.registerFactory<HomeCategoriesCubit>(() => HomeCategoriesCubit(sl()));
  sl.registerFactory<HomeQuizzesCubit>(() => HomeQuizzesCubit(sl()));
  sl.registerFactory<GameCubit>(() => GameCubit(sl()));
  sl.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl(),sl(),sl(),sl(),sl()));
  sl.registerFactory<SettingCubit>(() => SettingCubit(sl()));
  sl.registerFactory<QuestionCubit>(() => QuestionCubit(sl()));
  sl.registerLazySingleton<CreateQuestionAnswersCubit>(() => CreateQuestionAnswersCubit());
  sl.registerLazySingleton<UploadImageCubit>(() => UploadImageCubit());
}