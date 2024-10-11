import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizer/core/helper/dio_factory.dart';
import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';
import 'package:quizer/features/data_sources/repository_impl/account_repository.dart';
import 'package:quizer/features/data_sources/repository_impl/auth_repository.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';
import 'package:quizer/features/domain/usecases/facebook_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/get_otp_usecase.dart';
import 'package:quizer/features/domain/usecases/google_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/domain/usecases/otp_profile_usecase.dart';
import 'package:quizer/features/domain/usecases/register_usecase.dart';
import 'package:quizer/features/domain/usecases/reset_password_usecase.dart';
import 'package:quizer/features/domain/usecases/user_exist_usecase.dart';
import 'package:quizer/features/domain/usecases/verify_otp_usecase.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/cubit/login_cubit.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/domain/usecases/get_profile_data_usecase.dart';
import '../features/presentation/cubit/profile_cubit.dart';

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

  /// UseCases
  sl.registerLazySingleton<GetProfileDataUseCase>(() => GetProfileDataUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<GetOTPUseCase>(() => GetOTPUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton<UserExistUseCase>(() => UserExistUseCase(sl()));
  sl.registerLazySingleton<GoogleAuthUseCase>(() => GoogleAuthUseCase(sl()));
  sl.registerLazySingleton<FacebookAuthUseCase>(() => FacebookAuthUseCase(sl()));
  sl.registerLazySingleton<OtpProfileUseCase>(() => OtpProfileUseCase(sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(sl()));

  /// Cubits
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl(),sl(),sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl(),sl(),sl()));
  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(sl()));
  sl.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl(),sl(),sl(),sl(),sl()));
}