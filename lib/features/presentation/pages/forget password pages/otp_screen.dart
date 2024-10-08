import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/state/login_state.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.purpleColor50,
              AppColors.purpleColor30,
              AppColors.purpleColor10,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.height * 0.1),
              // Title
              Text(
                'OTP 🔐',
                style: AppTextStyles.headerSignupTextStyle(context),
              ),
              SizedBox(height: AppSize.s8.h),
              // Avatar from SVG
              CircleAvatar(
                radius: AppSize.s60.r,
                backgroundColor: AppColors.transparentColor,
                child: SvgPicture.asset('assets/svg/Avatar.svg'),
              ),
              SizedBox(height: AppSize.s16.h),
              // User Name
              Text(
                'Tarek Tarek',
                style: AppTextStyles.otpTextStyle(context),
              ),
              const Spacer(), // Pushes the buttons to the bottom
              // Dark Purple Button
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if(state is LoginSuccess) {
                    context.pushNamed(Routes.otpCheckScreenRoute);
                  }
                },
                child: CustomButton(
                  text: "Get OTP",
                  onPressed: () async {
                    await context.read<LoginCubit>().getOTP();
                    context.pushNamed(Routes.otpCheckScreenRoute);
                  },
                  color: AppColors.purpleColor50, // Dark Purple
                  colorText: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 20),
              // Light Purple Button
              CustomButton(
                text: "Not your account?",
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColors.purpleColor30, // Light Purple
                colorText: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
