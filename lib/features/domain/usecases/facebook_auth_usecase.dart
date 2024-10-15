import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class FacebookAuthUseCase {
  final AuthRepository repository;

  FacebookAuthUseCase(this.repository);

  Future<User?> call() async => await repository.authWithFacebook();
}
