import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState { // TODO change data to home data: [image, name, rank, points, task, categories, quizzes]
  final User user;

  HomeSuccess(this.user);

  @override
  List<Object?> get props => [
    user.firstName,
    user.lastName,
    user.rank,
    user.points,
    user.profileImage
  ];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);

  @override
  List<Object?> get props => [error];
}
