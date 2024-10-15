import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/facebook_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/google_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/domain/usecases/user_exist_usecase.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUserUseCase;
  final GoogleAuthUseCase googleAuthUserUseCase;
  final FacebookAuthUseCase facebookAuthUseCase;
  final UserExistUseCase userExistUseCase;
  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(
    this.loginUserUseCase,
    this.googleAuthUserUseCase,
    this.facebookAuthUseCase,
    this.userExistUseCase,
  ) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final user = User(
        email: emailController.text,
        password: passwordController.text,
      );
      final dataUser = await loginUserUseCase.call(user);
      DataIntent.pushDataUser(dataUser);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<void> authWithGoogle() async {
    emit(LoginLoading());
    try {
      var userGoogle = await googleAuthUserUseCase.call();
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }

  Future<bool?> authWithFacebook() async {
    emit(LoginLoading());
    try {
      var p = await facebookAuthUseCase.call();
      if (p != null) {
        emit(LoginSuccess());
      }
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginPasswordVisibilityChanged(isPasswordVisible));
  }
}
