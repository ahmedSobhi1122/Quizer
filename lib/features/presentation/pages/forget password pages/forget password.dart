import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/routes/route_constants.dart';
import '../../../../core/helper/validation.dart';
import '../data info page/widgets/date_of_birth.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();

  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isLoading = false;

  void _onConfirmPressed() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      // Additional actions after loading can go here.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: context.width,
            height: context.height,
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: context.height * 0.1),
                    // Title and subtitle
                    Text(
                      'GET Email',
                      style: AppTextStyles.headerSignupTextStyle(context),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your email',
                      style: AppTextStyles.subHeaderSignupTextStyle(context),
                    ),
                    SizedBox(height: AppSize.s310.h),
                    // Email TextField
                    Container(
                      width: context.width * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        width: AppSize.s335.w,
                        child: TextFormField(
                          decoration: style("Email"),
                          validator: (value) => Validation.validateEmail(value),
                          keyboardType: TextInputType.emailAddress,
                          style: AppTextStyles.textStyle(context),
                        ),
                      ),
                    ),
                     SizedBox(height: AppSize.s230.h), // Space for better layout
                    // Buttons at the bottom
                    Column(
                      children: [
                        CustomButton(
                          text: "Confirm",
                          onPressed: () {
                            _onConfirmPressed();
                            context.pushNamed(Routes.OtpScreenRoute);
                          },
                          color: AppColors.purpleColor,
                          colorText: AppColors.whiteColor,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: "Back",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: AppColors.purpleColor30,
                          colorText: AppColors.purpleColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40), // Extra space at the bottom
                  ],
                ),
              ),
            ),
          ),
        ),
        // Loading screen overlay
        if (isLoading)
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}