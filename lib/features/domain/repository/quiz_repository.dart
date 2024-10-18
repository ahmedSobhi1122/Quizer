import 'package:quizer/features/domain/entities/quiz.dart';

abstract class QuizRepository {
  Future<Quiz> getQuiz(String token, int id);
}