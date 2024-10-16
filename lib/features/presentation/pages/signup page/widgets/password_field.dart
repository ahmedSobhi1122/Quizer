import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';

import '../../../../../config/themes/theme.dart';

class PasswordField extends StatelessWidget {
  bool isPasswordVisible;

  PasswordField({
    super.key,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s335.w,
      child: TextFormField(
        controller:
        context.read<RegisterCubit>().passwordController,
        obscureText: !context.read<RegisterCubit>().isPasswordVisible,
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
              color: Colors.black45,
            ),
            onPressed: () =>
                context.read<RegisterCubit>().togglePasswordVisibility(),
          ),
        ),
        focusNode: context.read<RegisterCubit>().passwordFocusNode,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(
            context.read<RegisterCubit>().confirmPasswordFocusNode),
      ),
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  bool isConfirmPasswordVisible;

  ConfirmPasswordField({
    super.key,
    this.isConfirmPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s335.w,
      child: TextFormField(
        controller: context.read<RegisterCubit>().confirmPasswordController,
        obscureText: !context.read<RegisterCubit>().isConfirmPasswordVisible,
        keyboardType: TextInputType.visiblePassword,
        obscuringCharacter: "※",
        style: AppTextStyles.textStyle(context),
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          labelStyle: const TextStyle(color: MyTheme.disabledColor),
          contentPadding: EdgeInsets.all(AppPadding.defaultPadding.r),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black45,
            ),
            onPressed: () =>
                context.read<RegisterCubit>().toggleConfirmPasswordVisibility(),
          ),
        ),
        validator: (value) => Validation.validateConfirmPassword(
            context.read<RegisterCubit>().passwordController.text, value),
        focusNode: context.read<RegisterCubit>().confirmPasswordFocusNode,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
