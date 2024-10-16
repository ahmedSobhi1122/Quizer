import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';

import '../../domain/usecases/get_home_quizzes_usecase.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeProfileUseCase getHomeProfileDataUseCase;
  final GetHomeQuizzesUseCase getHomeQuizzesUseCase;

  HomeCubit(this.getHomeProfileDataUseCase, this.getHomeQuizzesUseCase) : super(HomeInitial());

  Future<void> getHomeProfileData(String userID, token) async {
    emit(HomeProfileDataLoading());
    try {
      final result = await getHomeProfileDataUseCase(userID);
      final quizzes = await getHomeQuizzesUseCase(token);
      print(result);
      print(quizzes);
      emit(HomeProfileDataSuccess(result, false, quizzes));
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
