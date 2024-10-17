import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/password_field.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

import '../../../../../config/themes/theme.dart';

class Fields extends StatelessWidget {
  final GlobalKey<FormState> formKeyRegister;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  Fields({
    super.key, required this.formKeyRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyRegister,
      child: Column(
        children: [
          SizedBox(
            width: AppSize.s335.w,
            child: TextFormField(
              controller: context.read<RegisterCubit>().emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: MyTheme.disabledColor),
                contentPadding: EdgeInsets.all(AppPadding.defaultPadding.r),
                border: const OutlineInputBorder(),
              ),
              validator: (value) => Validation.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.textStyle(context),
              focusNode: context.read<RegisterCubit>().emailFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(
                  context.read<RegisterCubit>().passwordFocusNode),
            ),
          ),
          SizedBox(height: AppSize.s24.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterPasswordVisibilityChanged) {
                isPasswordVisible = state.isPasswordVisible;
              }
              return PasswordField(
                isPasswordVisible: isPasswordVisible,
              );
            },
          ),
          SizedBox(height: AppSize.s24.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterConfirmPasswordVisibilityChanged) {
                isConfirmPasswordVisible = state.isConfirmPasswordVisible;
              }
              return ConfirmPasswordField(
                isConfirmPasswordVisible: isConfirmPasswordVisible,
              );
            },
          ),
        ],
      ),
    );
  }
}
