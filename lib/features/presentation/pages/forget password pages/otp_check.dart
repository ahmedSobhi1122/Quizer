import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';


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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    controller: context.read<LoginCubit>().otpController[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    focusNode: context.read<LoginCubit>().otpFocusNode[index],
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(
                      (index != 3)
                          ? context.read<LoginCubit>().otpFocusNode[index + 1]
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
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context)
                            .nextFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: AppSize.s260.h),
            CustomButton(
              text: "Verify",
              onPressed: () {
                context.pushNamed(Routes.newPasswordScreenRoute);
              },
              color: AppColors.purpleColor50, // Dark Purple
              colorText: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
