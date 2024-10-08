import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/facebook_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/google_auth_usecase.dart';
import 'package:quizer/features/domain/usecases/register_usecase.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUserUseCase;
  final GoogleAuthUseCase googleAuthUserUseCase;
  final FacebookAuthUseCase facebookAuthUserUseCase;

  final formKeyInfo = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  late UserRole userRole = UserRole.values.first;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  RegisterCubit(this.registerUserUseCase, this.googleAuthUserUseCase, this.facebookAuthUserUseCase) : super(RegisterInitial());

  @override
  void emit(RegisterState state) {
      if(!isClosed){
        super.emit(state);
      }
  }

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      final user = User(
        type: userRole,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        birthDate: DateTime.parse(birthDateController.text),
        email: emailController.text,
        password: passwordController.text,
      );
      await registerUserUseCase.call(user);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }

  Future<void> registerWithGoogle() async {
    emit(RegisterLoading());
    try {
      await googleAuthUserUseCase.call();
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }

  Future<void> registerWithFacebook() async {
    emit(RegisterLoading());
    try {
      var p = await facebookAuthUserUseCase.call();
      print(" ${p?.providerData},");
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }
}
