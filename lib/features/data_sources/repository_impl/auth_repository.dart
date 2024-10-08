import 'package:quizer/features/data_sources/API/remote_data_source.dart';
import 'package:quizer/features/data_sources/models/user_login_model.dart';
import 'package:quizer/features/data_sources/models/user_otp_profile_model.dart';
import 'package:quizer/features/data_sources/models/user_register_model.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> register(User user) async => await remoteDataSource.registerUser(
        UserRegisterModel(
          type: user.type,
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          birthDate: user.birthDate,
          email: user.email,
          password: user.password,
        ),
      );

  @override
  Future<void> login(User user) async => await remoteDataSource.loginUser(
        UserLoginModel(
          email: user.email,
          password: user.password,
        ),
      );

  @override
  Future<firebase_auth.User?> authWithGoogle() async =>
      await remoteDataSource.signInWithGoogle();

  @override
  Future<firebase_auth.User?> authWithFacebook() async =>
      await remoteDataSource.signInWithFacebook();

  @override
  Future<bool> userExist(String email) async =>
      await remoteDataSource.userExist(email);

  @override
  Future<void> getOTP(String email) async =>
      await remoteDataSource.getOTP(email);

  @override
  Future<void> verifyOTP(String email, String code) async =>
      await remoteDataSource.verifyOTP(email, code);

  @override
  Future<User> otpProfile(String email) async {
    OTPProfileModel user = await remoteDataSource.otpProfile(email);
    return User(
      firstName: user.firstName,
      lastName: user.lastName,
      profileImage: user.profileImage,
    );
  }
}
