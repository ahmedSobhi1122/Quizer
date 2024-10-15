import '../entities/user.dart';

abstract class AccountRepository {
  Future<User> homeProfile(String userID);
  Future<User> getProfile(String id,String token);
  Future<void> updateProfile(String email);
  Future<void> deleteAccount(String email);
}