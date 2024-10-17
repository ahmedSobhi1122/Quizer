import 'package:quizer/features/presentation/state/home_quizzes_state.dart';

import '../../../config/routes/screen_export.dart';
import '../../domain/usecases/get_home_quizzes_usecase.dart';

final class HomeQuizzesCubit extends Cubit<HomeQuizzesState>
{
  final GetHomeQuizzesUseCase getHomeQuizzesUseCase;
  HomeQuizzesCubit(this.getHomeQuizzesUseCase) : super(HomeQuizzesInitial());

  Future<void> getHomeQuizzes (String token) async
  {
    emit(HomeQuizzesLoading());
    try
    {
      final quizzes = await getHomeQuizzesUseCase(token);
      emit(HomeQuizzesLoaded(quizzes));
    }
    catch (e)
    {
      emit(HomeQuizzesFailure(e.toString()));
    }
  }
}