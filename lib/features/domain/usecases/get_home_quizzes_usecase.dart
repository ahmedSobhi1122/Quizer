import 'package:quizer/features/domain/entities/quiz.dart';

import '../repository/account_repository.dart';

class GetHomeQuizzesUseCase {
  final AccountRepository repository;

  GetHomeQuizzesUseCase(this.repository);

  Future<List<Quiz>> call(String token) async => await repository.getHomeQuizzes(token);
}