import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/features/presentation/state/upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  final ImagePicker _picker = ImagePicker();

  Future<XFile?> upload() async
  {
    emit(UploadImageLoading());
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    emit(UploadImageSuccess());
    return pickedImage;
  }

}
