import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quizer/core/helper/dio_factory.dart';
import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';
import 'package:quizer/features/data_sources/repository_impl/auth_repository.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/domain/usecases/register_usecase.dart';
import 'package:quizer/features/presentation/cubit/login_cubit.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AppPrefs>(() => AppPrefsImpl(sharedPreferences));
  sl.registerLazySingleton<LoginUserUseCase>(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton<RegisterUserUseCase>(() => RegisterUserUseCase(sl()));

  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl()));


}