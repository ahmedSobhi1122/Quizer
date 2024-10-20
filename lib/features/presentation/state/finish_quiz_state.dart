import 'package:equatable/equatable.dart';

abstract class FinishQuizState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class FinishQuizInitial extends FinishQuizState{}
class FinishQuizLoading extends FinishQuizState
{

}
class FinishQuizLoaded extends FinishQuizState{}
class FinishQuizFailure extends FinishQuizState{}