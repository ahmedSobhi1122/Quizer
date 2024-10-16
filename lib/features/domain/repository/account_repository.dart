import 'package:quizer/features/domain/entities/quiz.dart';

import '../entities/category.dart';
import '../entities/user.dart';

abstract class AccountRepository {
  Future<User> homeProfile(String userID);
  Future<List<Quiz>> getHomeQuizzes(String token);
  Future<List<Category>> getHomeCategories(String token);
  Future<User> getProfile(String id,String token);
  Future<void> updateProfile(String email);
  Future<void> deleteAccount(String email);
}