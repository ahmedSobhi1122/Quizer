import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/checkable.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/login_cubit.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

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
                  Text(
                    '''Login''',
                    textAlign: TextAlign.left,
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    '''Please Enter your email & password''',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s70.h),
                  SizedBox(
                    width: AppSize.s335.w,
                    child: TextField(
                      controller: context.read<LoginCubit>().emailController,
                      decoration: style("Email"),
                      keyboardType: TextInputType.emailAddress,
                      style: AppTextStyles.textStyle(context),
                    ),
                  ),
                  SizedBox(height: AppSize.s32.h),
                  SizedBox(
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
                              const TextStyle(color: AppColors.purpleColor),
                          contentPadding:
                              EdgeInsets.all(AppPadding.defaultPadding.r),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              context.read<LoginCubit>().isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.purpleColor50,
                            ),
                            onPressed: () => context
                                .read<LoginCubit>()
                                .togglePasswordVisibility(),
                          ),
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.s24.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          DataIntent.pushEmail(
                              context.read<LoginCubit>().emailController.text);
                          context.pushNamed(Routes.forgetPasswordScreenRoute);
                        },
                        child: Text(
                          "forgot password?",
                          style: AppTextStyles.forgotPasswordTextStyle(context),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s52.w,
                      ),
                      const Checkable(),
                      Text(
                        "Remember me",
                        style: AppTextStyles.rememberMeTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppSize.s140.w,
                        height: AppSize.s1_5.h,
                        color: AppColors.lightGreyColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.defaultPadding.w),
                        child: Text(
                          "OR",
                          style: AppTextStyles.orTextStyle(context),
                        ),
                      ),
                      Container(
                        width: AppSize.s140.w,
                        height: AppSize.s1_5.h,
                        color: AppColors.lightGreyColor,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s24.h),
                  Social(
                    onTapFacebook: () =>
                        context.read<LoginCubit>().loginWithFacebook(),
                    onTapGoogle: () =>
                        context.read<LoginCubit>().loginWithGoogle(),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.message(message: "success");
                      } else if (state is LoginFailure) {
                        context.message(message: "error${state.error}");
                      }
                    },
                    child: CustomButton(
                      color: AppColors.purpleColor,
                      colorText: AppColors.whiteColor,
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
                    color: AppColors.lightPurpleColor.withOpacity(.7),
                    colorText: AppColors.purpleColor,
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
