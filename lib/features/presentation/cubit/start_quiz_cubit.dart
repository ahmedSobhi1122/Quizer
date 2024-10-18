import 'package:quizer/features/domain/usecases/get_quiz_usecase.dart';
import 'package:quizer/features/presentation/state/start_quiz_state.dart';
import '../../../config/routes/screen_export.dart';
import '../../domain/entities/quiz.dart';

class StartQuizCubit extends Cubit<StartQuizState>
{
  final GetQuizUseCase getQuizUseCase;
  StartQuizCubit(this.getQuizUseCase) : super(StartQuizInitial());

  Future<void> getQuizData(String token, int id) async
  {
    emit(StartQuizLoading());
    try
    {
      final Quiz quiz = await getQuizUseCase(token, id);
      emit(StartQuizLoaded(quiz));
    }
    catch(e)
    {
      emit(StartQuizFailure(e.toString()));
    }
  }

}