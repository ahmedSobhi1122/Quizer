
import 'package:quizer/features/domain/repository/auth_repository.dart';

class UserExistUseCase {
  final AuthRepository repository;

  UserExistUseCase(this.repository);

  Future<bool> call(String email) async => await repository.userExist(email);
}
