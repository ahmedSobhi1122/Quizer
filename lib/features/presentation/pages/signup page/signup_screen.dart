import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/checkable.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<RegisterCubit>().emailController = TextEditingController();
  //   context.read<RegisterCubit>().passwordController = TextEditingController();
  //   context.read<RegisterCubit>().confirmPasswordController = TextEditingController();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   context.read<RegisterCubit>().birthDateController.dispose();
  //   context.read<RegisterCubit>().passwordController.dispose();
  //   context.read<RegisterCubit>().emailController.dispose();
  //   context.read<RegisterCubit>().lastNameController.dispose();
  //   context.read<RegisterCubit>().firstNameController.dispose();
  //   context.read<RegisterCubit>().confirmPasswordController.dispose();
  //   context.read<RegisterCubit>().phoneNumberController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s24,
        paddingLeft: AppSize.s24,
        paddingTop: AppSize.s50,
        child: SingleChildScrollView(
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Form(
                key: context.read<RegisterCubit>().formKeyRegister,
                child: Column(children: [
                  Row(
                    children: [
                      CustomButtonBack(
                        onPressed: () => context
                            .pushReplacementNamed(Routes.dataInfoScreenRoute),
                      ),
                      SizedBox(
                        width: AppSize.s28.w,
                      ),
                      const CustomProgress(
                        start: 2,
                        end: 1,
                      ),
                    ],
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
                      textInputAction: TextInputAction.next,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(AppPadding.defaultPadding.r),
                          width: AppSize.s66.w,
                          height: AppSize.s66.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.purpleColor30),
                            borderRadius: BorderRadius.circular(AppSize.s16.r),
                            color: AppColors.whiteColor,
                          ),
                          child: SvgPicture.asset(SVGAssets.facebook),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s120.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(AppPadding.defaultPadding.r),
                          width: AppSize.s66.w,
                          height: AppSize.s66.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.purpleColor30),
                            borderRadius: BorderRadius.circular(AppSize.s16.r),
                            color: AppColors.whiteColor,
                          ),
                          child: SvgPicture.asset(SVGAssets.google),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s50.h),
                  CustomButton(
                    color: AppColors.purpleColor,
                    colorText: AppColors.whiteColor,
                    text: "SignUp",
                    onPressed: () async {
                      if (context
                          .read<RegisterCubit>()
                          .formKeyRegister
                          .currentState!
                          .validate()) {
                        await context.read<RegisterCubit>().register();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        context.pushReplacementNamed(Routes.profileScreenRoute);
                      }
                    },
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
