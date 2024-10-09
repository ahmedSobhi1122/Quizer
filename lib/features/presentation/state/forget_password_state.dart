import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordDataOTPProfileLoaded extends ForgetPasswordState {
  final User user;

  ForgetPasswordDataOTPProfileLoaded(this.user);

  @override
  List<Object?> get props => [user.firstName, user.lastName, user.profileImage];
}

class ForgetPasswordPasswordVisibilityChanged extends ForgetPasswordState {
  final bool isPasswordVisible;

  ForgetPasswordPasswordVisibilityChanged(this.isPasswordVisible);

  @override
  List<Object?> get props => [isPasswordVisible];
}

class ForgetPasswordConfirmPasswordVisibilityChanged extends ForgetPasswordState {
  final bool isConfirmPasswordVisible;

  ForgetPasswordConfirmPasswordVisibilityChanged(this.isConfirmPasswordVisible);

  @override
  List<Object?> get props => [isConfirmPasswordVisible];
}

class ForgetPasswordSuccess extends ForgetPasswordState {

}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
