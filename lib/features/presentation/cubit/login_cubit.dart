import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/login_usecase.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUseCase loginUserUseCase;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginUserUseCase) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final user = User(email: emailController.text, password: passwordController.text);
      await loginUserUseCase.call(user);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}