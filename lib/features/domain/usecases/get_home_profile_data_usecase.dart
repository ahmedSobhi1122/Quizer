import 'package:quizer/features/domain/entities/user.dart';

import '../repository/account_repository.dart';

class GetHomeProfileUseCase {
  final AccountRepository repository;

  GetHomeProfileUseCase(this.repository);

  Future<User> call(String userID) async => await repository.homeProfile(userID);
}