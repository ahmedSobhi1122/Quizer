import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDataOTPProfileLoaded extends HomeState {
  final User user;

  HomeDataOTPProfileLoaded(this.user);

  @override
  List<Object?> get props => [user.firstName, user.lastName, user.profileImage];
}

class HomeSuccess extends HomeState {}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);

  @override
  List<Object?> get props => [error];
}
