import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class LeaderboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LeaderBoardInitial extends LeaderboardState {}

class LeaderBoardLoading extends LeaderboardState {}

class LeaderBoardSuccess extends LeaderboardState {
  final List<User> users;

  LeaderBoardSuccess(this.users);

  @override
  List<Object?> get props => [users];
}

class LeaderBoardFailure extends LeaderboardState
{
  final String error;

  LeaderBoardFailure(this.error);

  @override
  List<Object?> get props => [error];
}