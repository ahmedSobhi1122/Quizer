import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/checkable.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/login_cubit.dart';
import 'package:quizer/features/presentation/pages/Login%20page/widgets/or_line.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

import '../../../../config/themes/theme.dart';
import '../../../../core/helper/validation.dart';
import '../signup page/widgets/social.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            paddingRight: AppSize.s24,
            paddingLeft: AppSize.s24,
            paddingTop: AppSize.s50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppSize.s80.h),
                  const Header(),
                  SizedBox(height: AppSize.s70.h),
                  const Email(),
                  SizedBox(height: AppSize.s32.h),
                  const Password(),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.s24.w,
                      ),
                      const ForgetPassword(),
                      SizedBox(
                        width: AppSize.s52.w,
                      ),
                      const Checkable(),
                    ],
                  ),
                  SizedBox(height: AppSize.s30.h),
                  const OrLine(),
                  SizedBox(height: AppSize.s24.h),
                  Social(
                    onTapFacebook: () async {
                      bool? ok = await context.read<LoginCubit>().authWithFacebook();
                    },
                    onTapGoogle: () async =>
                        await context.read<LoginCubit>().authWithGoogle(),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.message(message: "success");
                        context.pushReplacementNamed(Routes.MainScreenRoute);
                      } else if (state is LoginFailure) {
                        context.message(message: "error${state.error}");
                      }
                    },
                    child: CustomButton(
                      color: MyTheme.primaryButtonColor,
                      colorText: MyTheme.primaryButtonTextColor,
                      text: "Login",
                      onPressed: () async {
                        if (context
                                .read<LoginCubit>()
                                .emailController
                                .text
                                .isNotEmpty &&
                            context
                                .read<LoginCubit>()
                                .passwordController
                                .text
                                .isNotEmpty) {
                          await context.read<LoginCubit>().login();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: AppSize.s16.h),
                  CustomButton(
                    text: "Create new account",
                    onPressed: () =>
                        context.pushNamed(Routes.signUpScreenRoute),
                    color: MyTheme.secondaryButtonColor,
                    colorText: MyTheme.secondaryButtonTextColor,
                  )
                ],
              ),
            ),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              print(state);
              if (state is LoginLoading) {
                return const Loading();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DataIntent.pushEmail(
            context.read<LoginCubit>().emailController.text);
        context.pushNamed(Routes.forgetPasswordScreenRoute);
      },
      child: Text(
        "forgot password?",
        style: AppTextStyles.forgotPasswordTextStyle(context),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s335.w,
      child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
        return TextFormField(
          controller:
              context.read<LoginCubit>().passwordController,
          obscureText:
              !context.read<LoginCubit>().isPasswordVisible,
          validator: (value) =>
              Validation.validatePassword(value),
          keyboardType: TextInputType.visiblePassword,
          obscuringCharacter: "※",
          style: AppTextStyles.textStyle(context),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle:
                const TextStyle(color: MyTheme.disabledColor),
            contentPadding:
                EdgeInsets.all(AppPadding.defaultPadding.r),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                context.read<LoginCubit>().isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black45,
              ),
              onPressed: () => context
                  .read<LoginCubit>()
                  .togglePasswordVisibility(),
            ),
          ),
        );
      }),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s335.w,
      child: TextField(
        controller: context.read<LoginCubit>().emailController,
        decoration: style("Email"),
        keyboardType: TextInputType.emailAddress,
        style: AppTextStyles.textStyle(context),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Login',
        style: AppTextStyles.headerSignupTextStyle(context),
      ),
      SizedBox(height: AppSize.s10.h),
      Text(
        'Please Enter your email & password',
        style: AppTextStyles.subHeaderSignupTextStyle(context),
      ),
    ],);
  }
}
