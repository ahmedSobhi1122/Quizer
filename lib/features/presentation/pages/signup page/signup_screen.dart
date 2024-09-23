import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: context.height * .032),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.purpleColor50,
              AppColors.purpleColor30,
              AppColors.purpleColor10,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
              children: [
            Row(
              children: [
                const BackButton(),
                SizedBox(
                  width: context.width * .12,
                ),
                const CustomProgress(
                  progress: 2,
                ),
              ],
            ),
            SizedBox(height: context.height * .025),
            Text(
              '''Create an account ✏️''',
              style: AppTextStyles.headerSignupTextStyle(context),
            ),
            SizedBox(height: context.height * .01),
            Text(
              '''Please complete your profile''',
              style: AppTextStyles.subHeaderSignupTextStyle(context),
            ),
            SizedBox(height: context.height * .0966),

            const Spacer(),
            const CustomButton(text: "Next"),
          ]),
        ));
  }
}
