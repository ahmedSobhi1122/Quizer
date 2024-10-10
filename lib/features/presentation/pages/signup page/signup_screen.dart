import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/checkable.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/social.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              child: Form(
                key: context.read<RegisterCubit>().formKeyRegister,
                child: Column(children: [
                  const CustomAppBar(
                    start: 0.0,
                    end: 3 / 1,
                  ),
                  SizedBox(height: AppSize.s40.h),
                  Text(
                    '''Create an account ✏️''',
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    '''Please enter your username, email address and password''',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s70.h),
                  SizedBox(
                    width: AppSize.s335.w,
                    child: TextFormField(
                      controller: context.read<RegisterCubit>().emailController,
                      decoration: style("Email"),
                      validator: (value) => Validation.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                      style: AppTextStyles.textStyle(context),
                      focusNode: context.read<RegisterCubit>().emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(
                              context.read<RegisterCubit>().passwordFocusNode),
                    ),
                  ),
                  SizedBox(height: AppSize.s32.h),
                  SizedBox(
                    width: AppSize.s335.w,
                    child: TextFormField(
                      controller:
                          context.read<RegisterCubit>().passwordController,
                      decoration: style("Password"),
                      validator: (value) => Validation.validatePassword(value),
                      keyboardType: TextInputType.visiblePassword,
                      obscuringCharacter: "※",
                      obscureText: true,
                      style: AppTextStyles.textStyle(context),
                      focusNode:
                          context.read<RegisterCubit>().passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(context
                              .read<RegisterCubit>()
                              .confirmPasswordFocusNode),
                    ),
                  ),
                  SizedBox(height: AppSize.s32.h),
                  SizedBox(
                    width: AppSize.s335.w,
                    child: TextFormField(
                      controller: context
                          .read<RegisterCubit>()
                          .confirmPasswordController,
                      decoration: style("Confirm Password"),
                      validator: (value) => Validation.validateConfirmPassword(
                          context.read<RegisterCubit>().passwordController.text,
                          value),
                      keyboardType: TextInputType.visiblePassword,
                      obscuringCharacter: "※",
                      obscureText: true,
                      style: AppTextStyles.textStyle(context),
                      focusNode: context
                          .read<RegisterCubit>()
                          .confirmPasswordFocusNode,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.s24.w,
                      ),
                      const Checkable(),
                      Text(
                        "Remember me",
                        style: AppTextStyles.rememberMeTextStyle(context),
                      ),
                    ],
                  ),
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
                  const Social(),
                  SizedBox(height: AppSize.s50.h),
                  BlocListener<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                      } else if (state is RegisterFailure) {
                        context.message(message: state.error);
                      } else {}
                    },
                    child: CustomButton(
                      color: AppColors.purpleColor,
                      colorText: AppColors.whiteColor,
                      text: "Next",
                      onPressed: () async {
                        if (context
                            .read<RegisterCubit>()
                            .formKeyRegister
                            .currentState!
                            .validate()) {
                          context
                              .pushReplacementNamed(Routes.selectionScreenRoute);
                          // context.message(message: "Register Success");
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              print(state);
              if (state is RegisterLoading) {
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
