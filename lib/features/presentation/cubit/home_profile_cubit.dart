import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/get_home_categories_usecase.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';

import '../../domain/usecases/get_home_quizzes_usecase.dart';
import '../state/home_profile_state.dart';

class HomeProfileCubit extends Cubit<HomeProfileState> {
  final GetHomeProfileUseCase getHomeProfileDataUseCase;

  HomeProfileCubit(this.getHomeProfileDataUseCase) : super(HomeProfileInitial());

  Future<void> getHomeProfile(String userID) async {
    emit(HomeProfileLoading());
    try
    {
      final result = await getHomeProfileDataUseCase(userID);
      emit(HomeProfileLoaded(result, false));
    }
    catch (e)
    {
      emit(HomeProfileFailure(e.toString()));
    }
  }
}
