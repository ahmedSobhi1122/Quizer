import 'package:quizer/features/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class AuthRepository {
  Future<void> register(User user);
  Future<void> login(User user);
  Future<bool> userExist(String email);
  Future<firebase_auth.User?> authWithGoogle();
  Future<firebase_auth.User?> authWithFacebook();
  Future<void> getOTP(String email);
  Future<void> verifyOTP(String email,String code);

}