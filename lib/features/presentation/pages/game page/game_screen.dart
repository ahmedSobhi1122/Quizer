import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/features/data_sources/models/question_model.dart';
import 'package:quizer/features/domain/entities/quiz.dart';
import 'package:quizer/features/presentation/cubit/game_cubit.dart';
import 'package:quizer/features/presentation/pages/game%20page/widgets/custom_bottom_navigation.dart';
import 'package:quizer/features/presentation/pages/game%20page/widgets/custom_question_view.dart';
import 'package:quizer/features/presentation/pages/game%20page/widgets/custom_timer_bar.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/state/game_state.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final List<QuestionModel?> questions;
  late final Quiz? quiz;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    quiz = DataIntent.getQuiz();
    questions = quiz!.questions!;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(questions),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return PageView.builder(
                  physics:  const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<GameCubit>().emit(
                        state.copyWith(currentQuestionIndex: index)); // Update the current question index in the cubit
                  },
                  itemCount: state.questions.length,
                  itemBuilder: (context, index) {
                    return Background(
                      paddingRight: AppPadding.p24,
                      paddingLeft: AppPadding.p24,
                      paddingTop: AppPadding.p50,
                      child: CustomQuestionView(
                        question: state.questions[index]!,
                        selectedAnswer: state.selectedAnswers[index],
                        onAnswerSelected: (String answer) {
                          context.read<GameCubit>().selectAnswer(index, answer);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return CustomTimerBar(
                  currentQuestionIndex: state.currentQuestionIndex,
                  totalQuestions: state.questions.length,
                  durationInMinutes: quiz!.maxTime!.toDouble(),
                );
              },
            ),
            CustomBottomNavigation(
              pageController: _pageController,
              totalQuestions: questions.length, 
            ),
          ],
        ),
      ),
    );
  }
}
