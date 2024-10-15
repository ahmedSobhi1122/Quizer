import 'package:equatable/equatable.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeProfileDataLoading extends HomeState {
  final bool noRebuild;
  HomeProfileDataLoading(this.noRebuild);

  @override
  List<Object?> get props => [noRebuild];
}

class HomeProfileDataSuccess extends HomeState { // TODO change data to home data: [image, name, rank, points, task, categories, quizzes]
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

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);

  @override
  List<Object?> get props => [error];
}

