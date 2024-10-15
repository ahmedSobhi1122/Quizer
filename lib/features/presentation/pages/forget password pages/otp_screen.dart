import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/constants/constants.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/forget_password_cubit.dart';
import 'package:quizer/features/presentation/state/forget_password_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final String firstName;
  late final String lastName;
  late final String image;

  @override
  void initState() {
    super.initState();
    context.read<ForgetPasswordCubit>().otpProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(
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
                      if (state is ForgetPasswordDataOTPProfileLoaded) {
                        firstName = state.user.firstName!;
                        lastName = state.user.lastName!;
                        image = state.user.profileImage!;
                      }

                      if (state is ForgetPasswordFailure) {
                        return Text(state.error);
                      } else if (state is ForgetPasswordDataOTPProfileLoaded ||
                          state is ForgetPasswordSuccess) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: AppSize.s60.r,
                              backgroundImage: NetworkImage(
                                Constants.url + image,
                              ),
                              backgroundColor: AppColors.transparentColor,
                            ),
                            SizedBox(height: AppSize.s16.h),
                            Text(
                              "$firstName $lastName",
                              style: AppTextStyles.otpTextStyle(context),
                            ),
                          ],
                        );
                      } else {
                        return Skeletonizer(
                          enabled: true,
                          child: CircleAvatar(
                            radius: AppSize.s60.r,
                            backgroundColor: AppColors.transparentColor,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: AppSize.s360.h,
                  ),
                  BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) {
                      final route = ModalRoute.of(context);
                      final isCurrentRoute = route?.isCurrent ?? false;
                      if (isCurrentRoute) {
                        print("otp screen $state");
                        if (state is ForgetPasswordSuccess) {
                          context.pushNamed(Routes.otpCheckScreenRoute);
                        } else {}
                      }
                    },
                    child: CustomButton(
                      text: "Get OTP",
                      onPressed: () async {
                        await context.read<ForgetPasswordCubit>().getOTP();
                      },
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
        // BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        //   builder: (context, state) {
        //     if (state is ForgetPasswordLoading) {
        //       return const Loading();
        //     } else {
        //       return const SizedBox.shrink();
        //     }
        //   },
        // ),
      ]),
    );
  }
}
