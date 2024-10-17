import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/get_profile_data_usecase.dart';
import 'package:quizer/features/domain/usecases/update_profile_usecase.dart';
import 'package:quizer/features/presentation/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;
  final UpdateProfileUsecase updateProfileUsecase;

  ProfileCubit(this.getProfileDataUseCase, this.updateProfileUsecase)
      : super(ProfileInitial());

  Future<Object> getProfile(String id, String token) async {
    emit(ProfileLoading());
    try {
      final User result = await getProfileDataUseCase(id, token);
      // print(result);
      emit(ProfileSuccess(result));
      return result;
    } catch (e) {
      print(e.toString());
      emit(ProfileFailure(e.toString()));
      return User();
    }
  }

  Future<void> editProfile(User user) async {
    try {
      await updateProfileUsecase(user);
      emit(ProfileUpdateSuccess());
    } catch (e) {
      print(e.toString());
      emit(ProfileFailure(e.toString()));
    }
  }
}
