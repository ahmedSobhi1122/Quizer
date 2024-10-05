import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/button_back.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/common/custom_progress.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class DataInfoScreen extends StatefulWidget {
  const DataInfoScreen({super.key});

  @override
  State<DataInfoScreen> createState() => _DataInfoScreenState();
}

class _DataInfoScreenState extends State<DataInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: context.width,
      height: context.height,
      padding: EdgeInsets.only(
          top: AppPadding.p50.h,
          right: AppPadding.p24.w,
          left: AppPadding.p24.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.purpleColor50,
          AppColors.purpleColor30,
          AppColors.purpleColor10,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(children: [
              Row(
                children: [
                  const CustomButtonBack(),
                  SizedBox(
                    width: AppSize.s28.w,
                  ),
                  const CustomProgress(
                    progress: 2,
                  ),
                ],
              ),
              SizedBox(height: AppSize.s40.h),
              Text(
                '''Create an account ✏️''',
                style: AppTextStyles.headerSignupTextStyle(context),
              ),
              SizedBox(height: AppSize.s10.h),
              Text(
                '''Please complete your profile''',
                style: AppTextStyles.subHeaderSignupTextStyle(context),
              ),
              SizedBox(height: AppSize.s90.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: AppSize.s335.w,
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: style("First Name"),
                        style: AppTextStyles.textStyle(context),
                        keyboardType: TextInputType.name,
                        validator: (value) => Validation.validateName(value),
                      ),
                    ),
                    SizedBox(height: AppSize.s32.h),
                    SizedBox(
                      width: AppSize.s335.w,
                      child: TextFormField(
                          controller: lastNameController,
                          decoration: style("Last Name"),
                          style: AppTextStyles.textStyle(context),
                          keyboardType: TextInputType.name,
                          validator: (value) =>
                              Validation.validateName(value)),
                    ),
                    SizedBox(height: AppSize.s32.h),
                    SizedBox(
                      width: AppSize.s335.w,
                      child: const DateOfBirth(),
                    ),
                    SizedBox(height: AppSize.s32.h),
                    SizedBox(
                      width: AppSize.s335.w,
                      child: TextFormField(
                          controller: phoneController,
                          decoration: style("Phone Number"),
                          keyboardType: TextInputType.phone,
                          style: AppTextStyles.textStyle(context),
                          validator: (value) =>
                              Validation.validatePhoneNumber(value)),
                    ),
                    SizedBox(height: AppSize.s230.h),
                    CustomButton(
                      color: AppColors.lightPurpleColor.withOpacity(.7),
                      colorText: AppColors.purpleColor,
                      text: "Next",
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          context.pushNamed(Routes.signUpScreenRoute);
                        // }
                      }
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    ));
  }
}
