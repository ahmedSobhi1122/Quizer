import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginDataOTPProfileLoaded extends LoginState {
  final User user;

  LoginDataOTPProfileLoaded(this.user);

  @override
  List<Object?> get props => [user.firstName, user.lastName, user.profileImage];
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
