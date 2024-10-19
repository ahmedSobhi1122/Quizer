import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/config/themes/theme.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/helper/validation.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/data_sources/local/app_prefs.dart';
import 'package:quizer/features/presentation/common/custom_button_with_shadow.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/pages/data%20info%20page/widgets/date_of_birth.dart';
import 'package:quizer/features/presentation/state/register_state.dart';

import '../../../../../core/constants/enum.dart';
import '../../../../../core/dependency_injection.dart';
import '../../../../../core/helper/data_intent.dart';

class Fields extends StatelessWidget {
  final GlobalKey<FormState> formKeyInfo = GlobalKey<FormState>();

  Fields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyInfo,
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
              final route = ModalRoute.of(context);
              final isCurrentRoute = route?.isCurrent ?? false;
              if (isCurrentRoute) {
                if (state is RegisterSuccess) {
                  sl<AppPrefs>().setBool(KeyPrefs.IS_LOGGEDIN.name, true);
                  sl<AppPrefs>().setString(KeyPrefs.TOKEN.name, DataIntent.getToken()!);
                  sl<AppPrefs>().setString(KeyPrefs.ID.name, DataIntent.getUserID()!);
                  context.pushReplacementNamed(Routes.MainScreenRoute);
                  context.message(message: "success");
                }
              }
            },
            child: CustomButton(
              color: MyTheme.secondaryButtonColor,
              colorText: MyTheme.secondaryButtonTextColor,
              text: "Sign Up",
              onPressed: () async {
                if (formKeyInfo.currentState!.validate()) {
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
