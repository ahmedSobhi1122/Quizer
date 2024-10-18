import 'package:equatable/equatable.dart';

abstract class SettingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingInitial extends SettingState {}

class SettingLoading extends SettingState {}

class SettingSuccess extends SettingState {}

class SettingFailure extends SettingState
{
  final String error;

  SettingFailure(this.error);
}