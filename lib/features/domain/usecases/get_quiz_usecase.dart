
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/domain/repository/quiz_repository.dart';

class GetQuizUseCase {
  final QuizRepository repository;

  GetQuizUseCase(this.repository);

  Future<Quiz> call(String token,int id) async => await repository.getQuiz(token,id);
}