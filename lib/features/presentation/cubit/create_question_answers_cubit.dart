import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/create_question_answers_state.dart';

class CreateQuestionAnswersCubit extends Cubit<CreateQuestionAnswersState> {

  CreateQuestionAnswersCubit() : super(CreateQuestionAnswersInitial());

  void editAnswer()
  {
    emit(CreateQuestionAnswersEdit());
    emit(CreateQuestionAnswersInitial());
  }

}
