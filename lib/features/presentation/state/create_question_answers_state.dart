import 'package:equatable/equatable.dart';

abstract class CreateQuestionAnswersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateQuestionAnswersInitial extends CreateQuestionAnswersState {}

class CreateQuestionAnswersEdit extends CreateQuestionAnswersState {}

class CreateQuestionAnswersFailure extends CreateQuestionAnswersState{
  final String error;
  CreateQuestionAnswersFailure(this.error);

  @override
  List<Object?> get props => [error];
}