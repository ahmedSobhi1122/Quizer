import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/quiz.dart';

abstract class HomeQuizzesState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class HomeQuizzesInitial extends HomeQuizzesState {}
class HomeQuizzesLoading extends HomeQuizzesState {}
class HomeQuizzesLoaded extends HomeQuizzesState
{
  final List<Quiz> quizzes;
  HomeQuizzesLoaded(this.quizzes);
  @override
  List<Object?> get props => [quizzes];
}

class HomeQuizzesFailure extends HomeQuizzesState
{
  final String error;

  HomeQuizzesFailure(this.error);

  @override
  List<Object?> get props => [error];
}