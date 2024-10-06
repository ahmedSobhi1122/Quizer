import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizer/features/domain/repository/auth_repository.dart';

class FacebookAuthUserUseCase {
  final AuthRepository repository;

  FacebookAuthUserUseCase(this.repository);

  Future<User?> call() async {
    return await repository.authWithFacebook();
  }
}