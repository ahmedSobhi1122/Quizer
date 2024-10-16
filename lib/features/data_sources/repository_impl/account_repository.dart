import 'package:quizer/features/data_sources/models/home_categories_model.dart';
import 'package:quizer/features/domain/entities/quiz.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/account_repository.dart';
import '../API/remote_data_source.dart';
import '../models/home_quizzes_model.dart';

class AccountRepositoryImpl implements AccountRepository {
  final RemoteDataSource remoteDataSource;

  AccountRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> homeProfile(String userID) async {
    final user = await remoteDataSource.homeProfile(userID);
    return User(
      firstName: user.firstName,
      lastName: user.lastName,
      rank: user.rank,
      points: user.points,
      profileImage: user.profileImage,
      dailyTask: user.dailyTask,
    );
  }

  @override
  Future<List<Quiz>> getHomeQuizzes(String token) async {
    final List<HomeQuizzesModel> quizModels =
    await remoteDataSource.homeQuizzes(token);
    List<Quiz> quizzes = [];
    for (var quizModel in quizModels) {
      quizzes.add(Quiz(
          id: quizModel.id,
          name: quizModel.name,
          description: quizModel.description,
          madeBy: quizModel.madeBy,
          rating: quizModel.rating,
          questionCount: quizModel.questionCount,
          maxTime: quizModel.maxTime,
          solveCount: quizModel.solveCount,
          image: quizModel.image,
          createdOn: quizModel.createdOn));
    }
    return quizzes;
  }

  @override
  Future<User> getProfile(String id, String token) async {
    final user = await remoteDataSource.getProfile(id, token);
    return User(
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      profileImage: user.profileImage,
      coverImage: user.coverImage,
      firstPlaceCount: user.firstPlaceCount,
      secondPlaceCount: user.secondPlaceCount,
      thirdPlaceCount: user.thirdPlaceCount,
      description: user.description,
      rank: user.rank,
    );
  }

  @override
  Future<void> deleteAccount(String email) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(String id) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getHomeCategories(String token) async {

    final List<HomeCategoriesModel> categoryModels = await remoteDataSource.homeCategories(token);

    List<Category> categories = [];
    for (var categoryModel in categoryModels) {
      categories.add(
          new Category
          (
          id: categoryModel.id,
          name: categoryModel.name,
          image: categoryModel.image,));
    }
    return categories;
  }
}
