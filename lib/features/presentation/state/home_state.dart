import 'package:equatable/equatable.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/domain/entities/category.dart';
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDataLoading extends HomeState {}

class HomeProfileDataSuccess extends HomeState {
  final User user;
  final bool noRebuild;

  HomeProfileDataSuccess(this.user, this.noRebuild);

  @override
  List<Object?> get props => [
    user.firstName,
    user.lastName,
    user.rank,
    user.points,
    user.profileImage,
    user.dailyTask,
    noRebuild
  ];

  String rankToString(Rank rank)
  {
    switch (rank) {
      case Rank.NEWBIE:
        return "Newbie";
      case Rank.APPRENTICE:
        return "Apprentice";
      case Rank.CHALLENGER:
        return "Challenger";
      case Rank.EXPERT:
        return "Expert";
      case Rank.MASTER_MIND:
        return "Master_Mind";
      default:
        return "Unknown";
    }
  }
}
class HomeQuizzesDataSuccess extends HomeState {
  final List<Quiz> quizzes;

  HomeQuizzesDataSuccess(this.quizzes);

  @override
  List<Object?> get props => [
    quizzes
  ];

  String rankToString(Rank rank)
  {
    switch (rank) {
      case Rank.NEWBIE:
        return "Newbie";
      case Rank.APPRENTICE:
        return "Apprentice";
      case Rank.CHALLENGER:
        return "Challenger";
      case Rank.EXPERT:
        return "Expert";
      case Rank.MASTER_MIND:
        return "Master_Mind";
      default:
        return "Unknown";
    }
  }
}
class HomeCategoriesDataSuccess extends HomeState {
  final List<Category> categories;

  HomeCategoriesDataSuccess(this.categories);

  @override
  List<Object?> get props => [
    categories
  ];

  String rankToString(Rank rank)
  {
    switch (rank) {
      case Rank.NEWBIE:
        return "Newbie";
      case Rank.APPRENTICE:
        return "Apprentice";
      case Rank.CHALLENGER:
        return "Challenger";
      case Rank.EXPERT:
        return "Expert";
      case Rank.MASTER_MIND:
        return "Master_Mind";
      default:
        return "Unknown";
    }
  }
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error){
    print(error);
    print("I Found YOU Bitch In Home State Failure");
  }

  @override
  List<Object?> get props => [error];
}


