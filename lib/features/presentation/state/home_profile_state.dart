import 'package:equatable/equatable.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class HomeProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeProfileInitial extends HomeProfileState {}

class HomeProfileLoading extends HomeProfileState {}

class HomeProfileLoaded extends HomeProfileState {
  final User user;
  final bool noRebuild;

  HomeProfileLoaded(this.user, this.noRebuild);

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

class HomeProfileFailure extends HomeProfileState {
  final String error;
  HomeProfileFailure(this.error){
    print(error);
  }

  @override
  List<Object?> get props => [error];
}


