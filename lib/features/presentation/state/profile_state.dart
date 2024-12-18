import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:quizer/features/domain/entities/user.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdateSuccess extends ProfileState {}

class ProfileCoverSelected extends ProfileState {
  File? image;
  ProfileCoverSelected(this.image);
  @override
  List<Object?> get props => [image];
}

class ProfileAvatarSelected extends ProfileState {
  File? image;
  ProfileAvatarSelected(this.image);
  @override
  List<Object?> get props => [image];
}

class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess(this.user);

  @override
  List<Object?> get props => [
        user.firstName,
        user.lastName,
        user.email,
        user.profileImage,
        user.coverImage,
        user.firstPlaceCount,
        user.secondPlaceCount,
        user.thirdPlaceCount,
        user.description,
        user.rank
      ];
}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}
