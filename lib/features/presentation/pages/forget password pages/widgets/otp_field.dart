import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';

class OTPCode extends StatelessWidget {
  const OTPCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 80.w,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextFormField(
            controller:
            context.read<ForgetPasswordCubit>().otpController[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            focusNode:
            context.read<ForgetPasswordCubit>().otpFocusNode[index],
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(
                  (index != 3)
                      ? context
                      .read<ForgetPasswordCubit>()
                      .otpFocusNode[index + 1]
                      : null,
                ),
            textInputAction: (index != 3)
                ? TextInputAction.next
                : TextInputAction.done,
            style: AppTextStyles.otpTextFieldTextStyle(context),
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              // filled: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        );
      }),
    );
  }
}