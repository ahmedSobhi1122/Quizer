import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/checkable.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/fields.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/or_line.dart';
import 'package:quizer/features/presentation/pages/signup%20page/widgets/social.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background(
            paddingRight: AppSize.s24,
            paddingLeft: AppSize.s24,
            paddingTop: AppSize.s50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    start: 0.0,
                    end: 3 / 1,
                  ),
                  SizedBox(height: AppSize.s20.h),
                  Text(
                    '''Create an account''',
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    'Please enter your username, email address',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  Text(
                    'and password',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  Fields(
                    formKeyRegister: formKeyRegister,
                  ),
                  SizedBox(height: AppSize.s12.h),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.s24.w,
                      ),
                      const Checkable(),
                    ],
                  ),
                  const OrLine(),
                  SizedBox(height: AppSize.s24.h),
                  const Social(),
                  SizedBox(height: AppSize.s50.h),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              text: "Sign in",
                              onPressed: () {
                                context.pushReplacementNamed(
                                    Routes.logInScreenRoute);
                              },
                              color: MyTheme.secondaryButtonColor,
                              colorText: MyTheme.secondaryButtonTextColor)),
                      SizedBox(width: AppSize.s24.w),
                      Expanded(
                        child: CustomButton(
                          color: MyTheme.secondaryButtonColor,
                          colorText: MyTheme.secondaryButtonTextColor,
                          text: "Next",
                          onPressed: () async {
                            if (formKeyRegister.currentState!.validate()) {
                              context.pushNamed(Routes.selectionScreenRoute);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
