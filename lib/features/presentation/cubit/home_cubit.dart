import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/get_home_profile_data_usecase.dart';

import '../../domain/entities/user.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeProfileUseCase getHomeProfileDataUseCase;

  HomeCubit(this.getHomeProfileDataUseCase) : super(HomeInitial());

  Future<void> getHomeProfileData(String userID) async {
    emit(HomeProfileDataLoading(true));
    try {
      final result = await getHomeProfileDataUseCase(userID);
      print(result);
      emit(HomeProfileDataSuccess(result, false));
    }
    catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
