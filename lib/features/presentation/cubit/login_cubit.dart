import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/facebook_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/get_otp_usecase.dart';
import 'package:quizer/features/domain/usecases/google_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/domain/usecases/otp_profile_usecase.dart';
import 'package:quizer/features/domain/usecases/user_exist_usecase.dart';
import 'package:quizer/features/domain/usecases/verify_otp_usecase.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUserUseCase;
  final GoogleAuthUseCase googleAuthUserUseCase;
  final FacebookAuthUseCase facebookAuthUserUseCase;
  final UserExistUseCase userExistUserUseCase;
  final GetOTPUseCase getOTPUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final OtpProfileUseCase otpProfileUseCase;

  final forgetPasswordFormKey = GlobalKey<FormState>();
  final verifyOtpFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<TextEditingController> otpController =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> otpFocusNode = List.generate(4, (index) => FocusNode());

  LoginCubit(
    this.loginUserUseCase,
    this.googleAuthUserUseCase,
    this.facebookAuthUserUseCase,
    this.userExistUserUseCase,
    this.getOTPUseCase,
    this.verifyOtpUseCase,
    this.otpProfileUseCase,
  ) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final user =
          User(email: emailController.text, password: passwordController.text);
      await loginUserUseCase.call(user);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      var p = await googleAuthUserUseCase.call();
      print(" ${p?.providerData},");
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    try {
      var p = await facebookAuthUserUseCase.call();
      print(" ${p?.providerData},");
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> checkUserExist() async {
    emit(LoginLoading());
    try {
      var p = await userExistUserUseCase.call(emailController.text);
      print("email: ${emailController.text} is exist: ${p},");
      if (p) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("User not found"));
      }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> getOTP() async {
    emit(LoginLoading());
    try {
      await getOTPUseCase.call(emailController.text);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> verifyOTP() async {
    emit(LoginLoading());
    try {
      var otp = otpController.map((e) => e.text).join();
      await verifyOtpUseCase.call(emailController.text, otp);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> otpProfile() async {
    emit(LoginLoading());
    try {
      User user = (await otpProfileUseCase.call(emailController.text));
      emit(LoginSuccess());
      emit(LoginDataOTPProfileLoaded(user));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
