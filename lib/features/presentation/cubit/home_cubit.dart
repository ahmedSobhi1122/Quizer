import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';

import '../../domain/entities/user.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeProfileUseCase getHomeProfileDataUseCase;

  HomeCubit(this.getHomeProfileDataUseCase) : super(HomeInitial());

  Future<User> getHome(String userID) async {
    emit(HomeLoading());
    try {
      final result = await getHomeProfileDataUseCase(userID);
      print(result);
      emit(HomeSuccess(result));
      return result;
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
      return User();
    }
  }
}
