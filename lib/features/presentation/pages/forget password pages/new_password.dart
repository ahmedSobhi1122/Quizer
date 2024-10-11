import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/pages/forget%20password%20pages/widgets/password_fields.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';

import '../../../../core/resources/app_values.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        paddingTop: AppSize.s20,
        paddingRight: AppSize.s20,
        paddingLeft: AppSize.s20,
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s28.h,
            ),
            const CustomAppBar(
              start: 2,
              end: 1,
            ),
            SizedBox(height: AppSize.s40.h),
            Text(
              'Create new password 🔒',
              style: AppTextStyles.headerSignupTextStyle(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Create a new and strong password',
              style: AppTextStyles.subHeaderSignupTextStyle(context),
              // Adjust the style as needed
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppSize.s140.h,
            ),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                if (state is ForgetPasswordPasswordVisibilityChanged) {
                  return PasswordField(
                    isPasswordVisible: state.isPasswordVisible,
                  );
                } else {
                  return PasswordField();
                }
              },
            ),
            SizedBox(height: AppSize.s32.h),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                if (state is ForgetPasswordConfirmPasswordVisibilityChanged) {
                  return ConfirmPasswordField(
                    isPasswordVisible: state.isConfirmPasswordVisible,
                  );
                } else {
                  return ConfirmPasswordField();
                }
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: AppSize.s260.h,
            ),
            BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                final route = ModalRoute.of(context);
                final isCurrentRoute = route?.isCurrent ?? false;
                if (isCurrentRoute) {
                  if (state is ForgetPasswordSuccess) {
                    context.message(
                      message: 'Password saved successfully!',
                      color: AppColors.successColor,
                    );
                    context.pushNamedAndRemoveUntil(
                      '/login',
                      predicate: (Route<dynamic> route) {
                        return false;
                      },
                    );
                  } else if (state is ForgetPasswordFailure) {
                    context.message(
                      message: state.error,
                      color: AppColors.errorColor,
                    );
                  }
                }
              },
              child: CustomButton(
                text: 'Reset Password',
                onPressed: () async {
                  await context.read<ForgetPasswordCubit>().resetPassword();
                },
                color: AppColors.purpleColor50, // Use your color resource
                colorText: AppColors.whiteColor, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
