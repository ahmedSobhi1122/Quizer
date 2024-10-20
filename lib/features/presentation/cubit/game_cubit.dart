import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_sources/models/question_model.dart';
import '../state/game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(List<QuestionModel?> questions)
      : super(GameState(
          questions: questions,
          currentQuestionIndex: 0,
          selectedAnswers: List<String?>.filled(questions.length, null),
        ));

  // Function to navigate to the next question
  void goToNextQuestion() {
    if (state.currentQuestionIndex < state.questions.length - 1) {
      emit(
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
    }
  }

  // Function to navigate to the previous question
  void goToPreviousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1));
    }
  }

  // Function to select an answer for a question
  void selectAnswer(int questionIndex, String? selectedAnswer) {
    final updatedAnswers = List<String?>.from(state.selectedAnswers);
    updatedAnswers[questionIndex] = selectedAnswer ?? "";

    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }
}
