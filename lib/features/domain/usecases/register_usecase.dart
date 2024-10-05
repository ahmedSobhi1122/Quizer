import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<void> call(User user) async {
    return await repository.register(user);
  }
}