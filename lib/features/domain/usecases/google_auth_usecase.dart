import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class GoogleAuthUseCase {
  final AuthRepository repository;

  GoogleAuthUseCase(this.repository);

  Future<User?> call() async => await repository.authWithGoogle();
}
