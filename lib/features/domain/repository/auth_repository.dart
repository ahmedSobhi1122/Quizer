import 'package:quizer/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<void> register(User user);
  Future<void> login(User user);
}