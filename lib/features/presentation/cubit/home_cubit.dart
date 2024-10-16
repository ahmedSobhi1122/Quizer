import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/get_home_categories_usecase.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';

import '../../domain/usecases/get_home_quizzes_usecase.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeProfileUseCase getHomeProfileDataUseCase;
  final GetHomeQuizzesUseCase getHomeQuizzesUseCase;
  final GetHomeCategoriesUseCase getHomeCategoriesUseCase;

  HomeCubit(this.getHomeProfileDataUseCase, this.getHomeQuizzesUseCase, this.getHomeCategoriesUseCase) : super(HomeInitial());

  Future<void> getHomeProfileData(String userID) async {
    emit(HomeDataLoading());
    try {
      final result = await getHomeProfileDataUseCase(userID);
      emit(HomeProfileDataSuccess(result, false));
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
  Future<void> getHomeQuizzesData(token) async {
    emit(HomeDataLoading());
    try {
      final quizzes = await getHomeQuizzesUseCase(token);
      emit(HomeQuizzesDataSuccess(quizzes));
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
  Future<void> getHomeCategoriesData(token) async {
    emit(HomeDataLoading());
    try {
      final categories = await getHomeCategoriesUseCase(token);
      emit(HomeCategoriesDataSuccess(categories));
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
