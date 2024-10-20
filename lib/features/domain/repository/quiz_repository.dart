import 'package:quizer/features/domain/entities/quiz.dart';

import '../../data_sources/models/quiz_model.dart';

abstract class QuizRepository {
  Future<Quiz> getQuiz(String token, int id);
  Future<void> createQuiz(String token, QuizModel quiz);
}