import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/features/domain/entities/user.dart';
import 'package:quizer/features/domain/usecases/register_usecase.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUserUseCase registerUserUseCase;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();



  RegisterCubit(this.registerUserUseCase) : super(RegisterInitial());

  Future<void> register(
    String firstName,
    String lastName,
    String phoneNumber,
    DateTime birthDate,
    String email,
    String password,
  ) async {
    emit(RegisterLoading());
    try {
      final user = User(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        email: email,
        password: password,
      );
      await registerUserUseCase.call(user);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }
}
