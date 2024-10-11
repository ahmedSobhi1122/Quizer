import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/constants.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForgetPasswordCubit>().otpProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s24,
        paddingLeft: AppSize.s24,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.height * 0.1),
                Text(
                  'OTP 🔐',
                  style: AppTextStyles.headerSignupTextStyle(context),
                ),
                SizedBox(height: AppSize.s8.h),
                // Avatar from SVG
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    print(state);
                    if (state is ForgetPasswordFailure) {
                      return Text(state.error);
                    } else if (state is ForgetPasswordDataOTPProfileLoaded) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: AppSize.s60.r,
                            backgroundImage: state.user.profileImage != null
                                ? NetworkImage(
                                    Constants.baseUrl.replaceAll("/api/", "") +
                                        state.user.profileImage!,
                                  )
                                : null,
                            backgroundColor: AppColors.transparentColor,
                            child: state.user.profileImage == null
                                ? Lottie.asset(
                                    LottieAssets.loading,
                                    width: AppSize.s100.w,
                                    height: AppSize.s100.h,
                                  )
                                : null,
                          ),
                          SizedBox(height: AppSize.s16.h),
                          // User Name
                          Text(
                            "${state.user.firstName!} ${state.user.lastName!}",
                            style: AppTextStyles.otpTextStyle(context),
                          ),
                        ],
                      );
                    } else {
                      return Lottie.asset(
                        LottieAssets.loading,
                        width: AppSize.s100.w,
                        height: AppSize.s100.h,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: AppSize.s360.h,
                ),
                BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    print("otp screen $state");
                    if (state is ForgetPasswordSuccess) {
                      context.pushNamed(Routes.otpCheckScreenRoute);
                    } else {
                      const Loading();
                    }
                  },
                  child: CustomButton(
                    text: "Get OTP",
                    onPressed: () async =>
                        await context.read<ForgetPasswordCubit>().getOTP(),
                    color: AppColors.purpleColor50, // Dark Purple
                    colorText: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 20.h),
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
      ),
    );
  }
}
