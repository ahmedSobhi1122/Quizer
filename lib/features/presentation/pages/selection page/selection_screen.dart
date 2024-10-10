import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/pages/selection%20page/widget/selected_container.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        paddingRight: AppSize.s24,
        paddingLeft: AppSize.s24,
        paddingTop: AppSize.s50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                start: 0.0,
                end: 3 / 2,
              ),
              SizedBox(height: AppSize.s40.h),
              Text(
                '''What type of account would you like to create? ''',
                style: AppTextStyles.headerSignupTextStyle(context),
              ),
              SizedBox(height: AppSize.s60.h),
              const Selection(),
              SizedBox(height: AppSize.s226.h),
              CustomButton(
                color: AppColors.buttonPurpleColor,
                colorText: AppColors.purpleColor,
                text: "Next",
                onPressed: () {
                  if (context.read<RegisterCubit>().userRole ==
                      UserRole.ADMIN) {
                    context.message(
                        message: "Please select one of the options above");
                  } else {
                    context.read<RegisterCubit>().userRole = UserRole.STUDENT;
                    context.pushNamed(Routes.dataInfoScreenRoute);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
