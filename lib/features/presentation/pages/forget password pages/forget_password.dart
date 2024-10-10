import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/data_intent.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';
import '../../../../core/helper/validation.dart';
import '../data info page/widgets/date_of_birth.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForgetPasswordCubit>().emailController.text = DataIntent.popEmail()??"";
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Background(
            paddingTop: AppSize.s0,
            paddingRight: AppSize.s0,
            paddingLeft: AppSize.s0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppSize.s100.h),
                  Text(
                    'GET Email',
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Text(
                    'Enter your email',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s310.h),
                  Form(
                    key: context.read<ForgetPasswordCubit>().forgetPasswordFormKey,
                    child: Column(
                      children: [
                        Container(
                          width: context.width * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: AppSize.s335.w,
                            child: TextFormField(
                              controller:
                                  context.read<ForgetPasswordCubit>().emailController,
                              decoration: style("Email"),
                              validator: (value) =>
                                  Validation.validateEmail(value),
                              keyboardType: TextInputType.emailAddress,
                              style: AppTextStyles.textStyle(context),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s224.h),
                        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                          listener: (context, state) {
                            if (state is ForgetPasswordSuccess) {
                              context.message(message: "success",);
                              context.pushNamed(Routes.otpScreenRoute);
                            } else if (state is ForgetPasswordFailure) {
                              context.message(message: "user not found");
                            }
                          },
                          child: CustomButton(
                            text: "Confirm",
                            onPressed: () async {
                              if (context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPasswordFormKey
                                  .currentState!
                                  .validate()) {
                                await context.read<ForgetPasswordCubit>().checkUserExist();
                              }
                            },
                            color: AppColors.purpleColor,
                            colorText: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    text: "Back",
                    onPressed: () => context.pop(),
                    color: AppColors.purpleColor30,
                    colorText: AppColors.purpleColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Loading screen overlay
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            print(state);
            if (state is ForgetPasswordLoading) {
              return const Loading();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
