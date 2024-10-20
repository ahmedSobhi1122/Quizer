import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/domain/entities/quiz.dart';


abstract class QuizRepository {
  Future<Quiz> getQuiz(String token, int id);
  Future<void> createQuiz(String token, QuizModel quiz);
}