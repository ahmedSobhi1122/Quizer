import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/password_field.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class Fields extends StatelessWidget {
  const Fields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKeyRegister,
      child: Column(
        children: [
          SizedBox(
            width: AppSize.s335.w,
            child: TextFormField(
              controller: context.read<RegisterCubit>().emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: AppColors.purpleColor),
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
                return PasswordField(
                  isPasswordVisible: state.isPasswordVisible,
                );
              } else {
                return PasswordField();
              }
            },
          ),
          SizedBox(height: AppSize.s24.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterConfirmPasswordVisibilityChanged) {
                return ConfirmPasswordField(
                  isPasswordVisible: state.isConfirmPasswordVisible,
                );
              } else {
                return ConfirmPasswordField();
              }
            },
          ),
        ],
      ),
    );
  }
}
