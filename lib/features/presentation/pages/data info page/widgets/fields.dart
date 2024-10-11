import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

class Fields extends StatelessWidget {
  const Fields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKeyInfo,
      child: Column(
        children: [
          SizedBox(
            width: AppSize.s335.w,
            child: TextFormField(
              controller: context.read<RegisterCubit>().firstNameController,
              decoration: style("First Name"),
              style: AppTextStyles.textStyle(context),
              keyboardType: TextInputType.name,
              validator: (value) => Validation.validateName(value),
              focusNode: context.read<RegisterCubit>().firstNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(
                  context.read<RegisterCubit>().lastNameFocusNode),
            ),
          ),
          SizedBox(height: AppSize.s32.h),
          SizedBox(
            width: AppSize.s335.w,
            child: TextFormField(
              controller: context.read<RegisterCubit>().lastNameController,
              decoration: style("Last Name"),
              style: AppTextStyles.textStyle(context),
              keyboardType: TextInputType.name,
              validator: (value) => Validation.validateName(value),
              focusNode: context.read<RegisterCubit>().lastNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
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
              controller: context.read<RegisterCubit>().phoneNumberController,
              decoration: style("Phone Number"),
              keyboardType: TextInputType.phone,
              style: AppTextStyles.textStyle(context),
              validator: (value) => Validation.validatePhoneNumber(value),
              focusNode: context.read<RegisterCubit>().phoneNumberFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
          SizedBox(height: AppSize.s160.h),
          BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                // context.pushNamed(Routes.signUpScreenRoute);
                context.message(message: "success");
              }
            },
            child: CustomButton(
              color: AppColors.lightPurpleColor.withOpacity(.7),
              colorText: AppColors.purpleColor,
              text: "Next",
              onPressed: () async {
                if (context
                    .read<RegisterCubit>()
                    .formKeyInfo
                    .currentState!
                    .validate()) {
                  context.pushNamed(Routes.signUpScreenRoute);
                  await context.read<RegisterCubit>().register();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
