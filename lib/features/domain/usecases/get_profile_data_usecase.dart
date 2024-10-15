
import '../entities/user.dart';
import '../repository/account_repository.dart';

class GetProfileDataUseCase {
  final AccountRepository repository;

  GetProfileDataUseCase(this.repository);

  Future<User> call(String id,String token) async => await repository.getProfile(id,token);
}