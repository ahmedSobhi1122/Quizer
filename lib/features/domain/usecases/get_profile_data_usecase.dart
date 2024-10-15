
import '../entities/user.dart';
import '../repository/account_repository.dart';

class GetProfileDataUseCase {
  final AccountRepository repository;

  GetProfileDataUseCase(this.repository);

  Future<User> call(String email) async => await repository.getProfile(email);
}