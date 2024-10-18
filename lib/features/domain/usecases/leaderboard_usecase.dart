import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/repository/account_repository.dart';

class LeaderboardUsecase {
  final AccountRepository repository;

  LeaderboardUsecase(this.repository);

  Future<List<User>> call(String token) async => await repository.getLeaderBoard(token);
}
