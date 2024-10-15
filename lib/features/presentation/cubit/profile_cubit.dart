import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/get_profile_data_usecase.dart';

import '../state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;

  ProfileCubit(this.getProfileDataUseCase) : super(ProfileInitial());

  Future<Object> getProfile(String email) async {
    emit(ProfileLoading());
    try {
      final User result = await getProfileDataUseCase(email);
      print(result);
      emit(ProfileSuccess(result));
      return result;
    } catch (e) {
      emit(ProfileFailure(e.toString()));
      return User();
    }
  }
}
