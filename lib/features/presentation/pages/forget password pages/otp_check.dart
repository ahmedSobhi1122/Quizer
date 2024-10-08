import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart'; // Import your custom progress component
import '../../common/button_back.dart'; // Import your back button component

class OtpCheckScreen extends StatelessWidget {
  const OtpCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s0,
        paddingLeft: AppSize.s0,
        paddingTop: AppSize.s0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize.s28.h,
            ), // Progress Row
            Row(
              children: [
                CustomButtonBack(onPressed: () => context.pop()),
                SizedBox(
                  width: AppSize.s28.w,
                ),
                const CustomProgress(
                  end: 2,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Title
            Text(
              'OTP 📱',
              style: AppTextStyles.headerSignupTextStyle(context),
            ),
            const SizedBox(height: 8),
            // OTP Info
            Text(
              'OTP is sent to your email:\n as1234@gmail.com',
              textAlign: TextAlign.center,
              style: AppTextStyles.subHeaderSignupTextStyle(context),
            ),
            SizedBox(height: AppSize.s218.h), // Adjusted height
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    controller: context.read<LoginCubit>().otpController[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.purpleColor30),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context)
                            .nextFocus(); // Move to the next field
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .previousFocus(); // Move to the previous field
                      }
                    },
                  ),
                );
              }),
            ),
            const Spacer(), // Pushes the button to the bottom
            // Verify Button
            CustomButton(
              text: "Verify",
              onPressed: () {
                context.pushNamed(Routes.newPasswordScreenRoute);
                // Debug print
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
