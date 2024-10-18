import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/usecases/delete_account_usecase.dart';
import 'package:quizer/features/presentation/state/setting_state.dart';


class SettingCubit extends Cubit<SettingState> {
  final DeleteAccountUsecase deleteAccountUsecase;

  SettingCubit(this.deleteAccountUsecase) : super(SettingInitial());

  Future<void> deleteAccount(String userID, String token) async {
    emit(SettingLoading());
    try {
      await deleteAccountUsecase.call(userID, token);
      emit(SettingSuccess());
    } catch (e) {
      emit(SettingFailure(e.toString()));
    }
  }
}
