import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';

import '../../../../../config/themes/theme.dart';

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
        labelStyle: const TextStyle(color: MyTheme.disabledColor),
        contentPadding: EdgeInsets.all(AppPadding.defaultPadding.r),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45, // Adjust color as needed
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
        labelStyle: const TextStyle(color: MyTheme.disabledColor),
        contentPadding: EdgeInsets.all(AppPadding.defaultPadding.r),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45, // Adjust color as needed
          ),
          onPressed: () => context
              .read<ForgetPasswordCubit>()
              .toggleConfirmPasswordVisibility(),
        ),
      ),
    );
  }
}
