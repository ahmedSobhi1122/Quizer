import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> register(User user) async {
    final userModel = UserRegisterModel(
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      birthDate: user.birthDate,
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

  @override
  Future<firebase_auth.User?> authWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }

  @override
  Future<firebase_auth.User?> authWithFacebook() async {
    return await remoteDataSource.signInWithFacebook();
  }
}
