import 'package:equatable/equatable.dart';

abstract class QuestionCreateState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class QuestionCreateInitial extends QuestionCreateState{}
class QuestionCreateAddAnswer extends QuestionCreateState{}
class QuestionCreateRemoveAnswer extends QuestionCreateState{}
class QuestionCreateAddQuestion extends QuestionCreateState{}
class QuestionCreatePageIndexChanged extends QuestionCreateState{}
class QuestionCreateLoading extends QuestionCreateState{}
class QuestionCreateFinish extends QuestionCreateState{}
class QuestionCreateFailure extends QuestionCreateState{
  final String error;
  QuestionCreateFailure(this.error);

  @override
  List<Object?> get props => [error];
}