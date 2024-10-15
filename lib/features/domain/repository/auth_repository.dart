import 'package:quizer/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<void> register(User user);
  Future<void> login(User user);
  Future<bool> userExist(String email);
  Future<User?> authWithGoogle();
  Future<User?> authWithFacebook();
  Future<void> getOTP(String email);
  Future<void> verifyOTP(String email,String code);
  Future<User> otpProfile(String email);
  Future<void> resetPassword(String email,String newPassword);
}