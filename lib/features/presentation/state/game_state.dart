
import '../../data_sources/models/question_model.dart';

class GameState {
  final List<QuestionModel?> questions;
  final int currentQuestionIndex;
  final List<String?> selectedAnswers;

  GameState({
    required this.questions,
    required this.currentQuestionIndex,
    required this.selectedAnswers,
  });

  // Copy method to create a new state with updated values
  GameState copyWith({
    List<QuestionModel?>? questions,
    int? currentQuestionIndex,
    List<String?>? selectedAnswers,
  })
  {
    return GameState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}