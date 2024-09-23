import 'package:flutter/material.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: context.width,
      height: context.height,
      padding: EdgeInsets.only(top: context.height * .032),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.purpleColor50,
          AppColors.purpleColor30,
          AppColors.purpleColor10,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              const BackButton(),
              SizedBox(
                width: context.width * .12,
              ),
              const CustomProgress(
                progress: 1,
              ),
            ],
          ),
          SizedBox(height: context.height * .025),
          Text(
            '''Create an account ✏️''',
            style: AppTextStyles.headerSignupTextStyle(context),
          ),
          SizedBox(height: context.height * .01),
          Padding(
            padding: const EdgeInsets.all(AppPadding.defaultPadding),
            child: Text(
              '''Please enter your username, email address and password''',
              style: AppTextStyles.subHeaderSignupTextStyle(context),
            ),
          ),
          SizedBox(height: context.height * .0966),
          SizedBox(
            width: context.width * .732,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "User Name",
                hoverColor: AppColors.purpleColor,
                hintStyle: TextStyle(color: AppColors.purpleColor50),
                contentPadding:
                EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              ),
              keyboardType: TextInputType.name,
              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: context.height * .025),
          SizedBox(
            width: context.width * .732,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Email",
                hoverColor: AppColors.purpleColor,
                hintStyle: TextStyle(color: AppColors.purpleColor50),
                contentPadding:
                EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              ),
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: context.height * .025),
          SizedBox(
            width: context.width * .732,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Password",
                hoverColor: AppColors.purpleColor,
                hintStyle: TextStyle(color: AppColors.purpleColor50),
                contentPadding:
                EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              ),
              // keyboardType: TextInputType.visiblePassword,
              obscuringCharacter: "※",
              obscureText: true,

              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: context.height * .025),
          SizedBox(
            width: context.width * .732,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                hoverColor: AppColors.purpleColor,
                hintStyle: TextStyle(color: AppColors.purpleColor50),
                contentPadding:
                EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
              ),
              // keyboardType: TextInputType.visiblePassword,
              obscuringCharacter: "※",
              obscureText: true,

              style: AppTextStyles.textStyle(context),
            ),
          ),
          SizedBox(height: context.height * 0.172,),
          CustomButton(
            color: AppColors.purpleColor,
            colorText:AppColors.whiteColor,
            text: "SignUp",
            onPressed: () {},
          ),
        ]),
      ),
    ));
  }
}

