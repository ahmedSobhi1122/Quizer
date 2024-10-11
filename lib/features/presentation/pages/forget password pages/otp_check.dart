import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/pages/forget%20password%20pages/widgets/otp_field.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';

class OtpCheckScreen extends StatelessWidget {
  const OtpCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        paddingRight: AppSize.s24,
        paddingLeft: AppSize.s24,
        paddingTop: AppSize.s0,
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s28.h,
            ),
            const CustomAppBar(
              end: 2,
            ),
            SizedBox(height: 10.h),
            // Title
            Text(
              'OTP 📱',
              style: AppTextStyles.headerSignupTextStyle(context),
            ),
            SizedBox(height: 8.h),
            // OTP Info
            Text(
              'OTP is sent to your email:\n${context.read<ForgetPasswordCubit>().emailController.text}',
              textAlign: TextAlign.center,
              style: AppTextStyles.subHeaderSignupTextStyle(context),
            ),
            SizedBox(height: AppSize.s210.h),
            Column(
              children: [
                const OTPCode(),
                SizedBox(height: AppSize.s260.h),
                BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    final route = ModalRoute.of(context);
                    final isCurrentRoute = route?.isCurrent ?? false;
                    if (isCurrentRoute) {
                      print(state);
                      if (state is ForgetPasswordSuccess) {
                        context.message(message: "الف مبروك");
                        context.pushNamed(Routes.newPasswordScreenRoute);
                      } else if (state is ForgetPasswordFailure) {
                        context.message(message: "OTP is incorrect");
                      }
                    }
                  },
                  child: CustomButton(
                    text: "Verify",
                    onPressed: () async
                    {
                      await context.read<ForgetPasswordCubit>().verifyOTP();
                    },
                    color: AppColors.purpleColor50, // Dark Purple
                    colorText: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
