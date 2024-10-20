import 'package:quizer/features/data_sources/models/quiz_model.dart';
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/domain/repository/quiz_repository.dart';

import '../API/remote_data_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final RemoteDataSource remoteDataSource;

  QuizRepositoryImpl(this.remoteDataSource);

  @override
  Future<Quiz> getQuiz(String token, int id) async {
    var quizModel = await remoteDataSource.getQuiz(token, id);
    return Quiz(
        id: quizModel.id,
        name: quizModel.name,
        description: quizModel.description,
        authorName: quizModel.authorName,
        authorImage: quizModel.authorImage,
        rating: quizModel.rating,
        questionCount: quizModel.questionCount,
        maxTime: quizModel.maxTime,
        solveCount: quizModel.solveCount,
        image: quizModel.image,
        createdOn: quizModel.createdOn,
        questions: quizModel.questions);
  }

  @override
  Future<void> createQuiz(String token, QuizModel quiz) async {
    await remoteDataSource.createQuizInfo(token, quiz);
  }
}
