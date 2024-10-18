import 'package:equatable/equatable.dart';

import '../../domain/entities/quiz.dart';

abstract class StartQuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartQuizInitial extends StartQuizState {}
class StartQuizLoading extends StartQuizState {}
class StartQuizLoaded extends StartQuizState {
  final Quiz quiz;
  StartQuizLoaded(this.quiz);

  @override
  List<Object?> get props => [quiz];
}

class StartQuizFailure extends StartQuizState {
  final String error;
  StartQuizFailure(this.error);

  @override
  List<Object?> get props => [error];
}