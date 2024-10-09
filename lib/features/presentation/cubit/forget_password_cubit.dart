import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/get_otp_usecase.dart';
import 'package:quizer/features/domain/usecases/otp_profile_usecase.dart';
import 'package:quizer/features/domain/usecases/reset_password_usecase.dart';
import 'package:quizer/features/domain/usecases/user_exist_usecase.dart';
import 'package:quizer/features/domain/usecases/verify_otp_usecase.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final UserExistUseCase userExistUserUseCase;
  final GetOTPUseCase getOTPUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final OtpProfileUseCase otpProfileUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  final forgetPasswordFormKey = GlobalKey<FormState>();
  final verifyOtpFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  List<TextEditingController> otpController =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> otpFocusNode = List.generate(4, (index) => FocusNode());

  ForgetPasswordCubit(
    this.userExistUserUseCase,
    this.getOTPUseCase,
    this.verifyOtpUseCase,
    this.otpProfileUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgetPasswordInitial());

  Future<void> checkUserExist() async {
    emit(ForgetPasswordLoading());
    try {
      var p = await userExistUserUseCase.call(emailController.text);
      print("email: ${emailController.text} is exist: ${p},");
      if (p) {
        emit(ForgetPasswordSuccess());
      } else {
        emit(ForgetPasswordFailure("User not found"));
      }
    } catch (error) {
      emit(ForgetPasswordFailure(error.toString()));
    }
  }

  Future<void> resetPassword() async {
    emit(ForgetPasswordLoading());
    try {
      await resetPasswordUseCase.call(
        emailController.text,
        newPasswordController.text,
      );
      emit(ForgetPasswordSuccess());
    } catch (error) {
      emit(ForgetPasswordFailure(error.toString()));
    }
  }

  Future<void> getOTP() async {
    emit(ForgetPasswordLoading());
    try {
      await getOTPUseCase.call(emailController.text);
      emit(ForgetPasswordSuccess());
    } catch (error) {
      emit(ForgetPasswordFailure(error.toString()));
    }
  }

  Future<void> verifyOTP() async {
    emit(ForgetPasswordLoading());
    try {
      var otp = otpController.map((e) => e.text).join();
      await verifyOtpUseCase.call(emailController.text, otp);
      emit(ForgetPasswordSuccess());
    } catch (error) {
      emit(ForgetPasswordFailure(error.toString()));
    }
  }

  Future<void> otpProfile() async {
    emit(ForgetPasswordLoading());
    try {
      User user = (await otpProfileUseCase.call(emailController.text));
      emit(ForgetPasswordDataOTPProfileLoaded(user));
    } catch (error) {
      emit(ForgetPasswordFailure(error.toString()));
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ForgetPasswordPasswordVisibilityChanged(isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ForgetPasswordConfirmPasswordVisibilityChanged(
        isConfirmPasswordVisible));
  }

  //dispose all controllers and focus nodes
  void dispose() {
    for (var controller in otpController) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNode) {
      focusNode.dispose();
    }
    emailController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }
}
