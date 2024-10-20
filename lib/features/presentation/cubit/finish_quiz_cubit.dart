import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/presentation/state/finish_quiz_state.dart';

class FinishQuizCubit extends Cubit<FinishQuizState>
{
  FinishQuizCubit() : super(FinishQuizInitial());

}