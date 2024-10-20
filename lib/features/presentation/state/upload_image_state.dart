import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploadImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}
class UploadImageSuccess extends UploadImageState {}

class UploadImageFailure extends UploadImageState{
  final String error;
  UploadImageFailure(this.error);

  @override
  List<Object?> get props => [error];
}