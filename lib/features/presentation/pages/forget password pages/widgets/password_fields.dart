import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';

class PasswordField extends StatelessWidget {
  bool isPasswordVisible;

  PasswordField({
    super.key,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<ForgetPasswordCubit>().newPasswordController,
      obscureText: !context.read<ForgetPasswordCubit>().isPasswordVisible,
      validator: (value) => Validation.validatePassword(value),
      keyboardType: TextInputType.visiblePassword,
      obscuringCharacter: "※",
      style: AppTextStyles.textStyle(context),
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.purpleColor50, // Adjust color as needed
          ),
          onPressed: () =>
              context.read<ForgetPasswordCubit>().togglePasswordVisibility(),
        ),
      ),
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  bool isPasswordVisible;

  ConfirmPasswordField({
    super.key,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:
          context.read<ForgetPasswordCubit>().confirmNewPasswordController,
      obscureText:
          !context.read<ForgetPasswordCubit>().isConfirmPasswordVisible,
      validator: (value) => Validation.validateConfirmPassword(
        context.read<ForgetPasswordCubit>().newPasswordController.text,
        value,
      ),
      keyboardType: TextInputType.visiblePassword,
      obscuringCharacter: "※",
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.purpleColor50, // Adjust color as needed
          ),
          onPressed: () => context
              .read<ForgetPasswordCubit>()
              .toggleConfirmPasswordVisibility(),
        ),
      ),
    );
  }
}
