import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(User user) async => await repository.login(user);
}
