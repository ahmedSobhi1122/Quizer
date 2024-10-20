import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/data_sources/models/answer_model.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';
import 'package:quizer/features/data_sources/models/quiz_model.dart';

import '../../domain/usecases/create_quiz_usecase.dart';
import '../state/question_create_state.dart';

class QuestionCubit extends Cubit<QuestionCreateState> {
  QuestionCubit(this.createQuizUseCase) : super(QuestionCreateInitial());
  List<QuestionModel> questions = [];
  List<AnswerModel> answers = [];
  final CreateQuizUseCase createQuizUseCase;

  void addQuestion(QuestionModel question) {
    questions.add(question);
    emit(QuestionCreateAddQuestion());
  }

  void removeAnswer(int index, AnswerModel answer) {
    questions[index].answers!.remove(answer);
    emit(QuestionCreateRemoveAnswer());
  }

  void pageChanged() {
    emit(QuestionCreateInitial());
    emit(QuestionCreatePageIndexChanged());
  }

  Future<void> sendRequest(String token, QuizModel quizModel) async {
    emit(QuestionCreateLoading());
    try{
      await createQuizUseCase.call(token, quizModel);
      emit(QuestionCreateFinish());
    }
    catch(e){
      emit(QuestionCreateFailure(e.toString()));
    }

  }

  int questionCount () => questions.length;
  int answerCount (int index) => questions[index].answers!.length;
}
