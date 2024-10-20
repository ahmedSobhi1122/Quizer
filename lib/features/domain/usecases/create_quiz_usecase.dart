import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/domain/repository/quiz_repository.dart';

class CreateQuizUseCase {
  final QuizRepository repository;

  CreateQuizUseCase(this.repository);

  Future<void> call(String token, QuizModel quizModel) async => await repository.createQuiz(token,quizModel);
}
