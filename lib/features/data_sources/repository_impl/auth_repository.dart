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
          userRole: user.userRole,
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
          birthDate: user.birthDate,
          email: user.email,
          password: user.password,
        ),
      );

  @override
  Future<User> login(User user) async {
    UserLoginModel userLogin = await remoteDataSource.loginUser(
      UserLoginModel(
        email: user.email,
        password: user.password,
      ),
    );
    return User(
      id: userLogin.id,
      userRole: userLogin.userRole,
      token: userLogin.token,
    );
  }

  @override
  Future<User?> authWithGoogle() async {
    firebase_auth.User? user = await remoteDataSource.signInWithGoogle();
    if (user == null) {
      return null;
    } else {
      return User(
        id: user.uid,
        email: user.email,
        firstName: user.displayName!.split(' ')[0],
        lastName: user.displayName!.split(' ')[1],
        profileImage: user.photoURL,
        phoneNumber: user.phoneNumber,
      );
    }
  }

  @override
  Future<User?> authWithFacebook() async {
    firebase_auth.User? user = await remoteDataSource.signInWithFacebook();
    if (user == null) {
      return null;
    } else {
      return User(
        email: user.email,
        firstName: user.displayName!.split(' ')[0],
        lastName: user.displayName!.split(' ')[1],
        profileImage: user.photoURL,
        phoneNumber: user.phoneNumber,
      );
    }
  }

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

  @override
  Future<void> resetPassword(String email, String newPassword) async =>
      await remoteDataSource.resetPassword(email, newPassword);
}
