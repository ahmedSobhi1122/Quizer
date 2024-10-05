import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> register(User user) async {
    final userModel = UserRegisterModel(
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      email: user.email,
      password: user.password,
    );
    return await remoteDataSource.registerUser(userModel);
  }

  @override
  Future<void> login(User user) async {
    final userModel = UserLoginModel(
      email: user.email,
      password: user.password,
    );
    return await remoteDataSource.loginUser(userModel);
  }
}
