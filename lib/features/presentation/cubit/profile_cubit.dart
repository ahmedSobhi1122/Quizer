import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/get_profile_data_usecase.dart';
import 'package:quizer/features/domain/usecases/update_profile_usecase.dart';
import 'package:quizer/features/presentation/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;
  final UpdateProfileUsecase updateProfileUsecase;

  final ImagePicker _picker = ImagePicker();

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

  Future<void> updateProfile({
    required String id,
    required String token,
    required String name,
    required String description,
    required File? profileImage,
    required File? coverImage,
  }) async {
    emit(ProfileLoading());
    try {
      await updateProfileUsecase(
        User(
          id: id,
          firstName: name.split(" ")[0],
          lastName: name.split(" ")[1],
          description: description,
          profileImageFile: profileImage,
          coverImageFile: coverImage,
          token: token
        ),
      );
      emit(ProfileUpdateSuccess());
    } catch (e) {
      print(e.toString());
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<void> coverImageSelection() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      emit(ProfileCoverSelected(File(pickedFile.path)));
    }
  }

  Future<void> profileImageSelection() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      emit(ProfileAvatarSelected(File(pickedFile.path)));
    }
  }
}
