import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/state/login_state.dart';

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
            CustomAppBar(
              onPressed: () => context.pop(),
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
              'OTP is sent to your email:\n as1234@gmail.com',
              textAlign: TextAlign.center,
              style: AppTextStyles.subHeaderSignupTextStyle(context),
            ),
            SizedBox(height: AppSize.s210.h),
            Form(
              key: context.read<LoginCubit>().verifyOtpFormKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        width: 80.w,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TextFormField(
                          controller:
                              context.read<LoginCubit>().otpController[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          focusNode:
                              context.read<LoginCubit>().otpFocusNode[index],
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).requestFocus(
                            (index != 3)
                                ? context
                                    .read<LoginCubit>()
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
                  ),
                  SizedBox(height: AppSize.s260.h),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.pushNamed(Routes.newPasswordScreenRoute);
                      }
                    },
                    child: CustomButton(
                      text: "Verify",
                      onPressed: () {
                        if (context
                            .read<LoginCubit>()
                            .verifyOtpFormKey
                            .currentState!
                            .validate()) {
                          context.read<LoginCubit>().verifyOTP();
                        }
                      },
                      color: AppColors.purpleColor50, // Dark Purple
                      colorText: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
