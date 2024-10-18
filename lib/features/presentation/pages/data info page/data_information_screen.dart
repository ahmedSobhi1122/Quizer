import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/common/background.dart';
import 'package:quizer/features/presentation/common/custom_app_bar.dart';
import 'package:quizer/features/presentation/common/loading.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';
import 'package:quizer/features/presentation/state/register_state.dart';
import 'widgets/fields.dart';

class DataInfoScreen extends StatelessWidget {
  const DataInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
          paddingRight: AppSize.s24,
          paddingLeft: AppSize.s24,
          paddingTop: AppSize.s50,
          child: SingleChildScrollView(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Column(children: [
                  const CustomAppBar(
                    start: 3 / 2,
                    end: 1,
                  ),
                  SizedBox(height: AppSize.s40.h),
                  Text(
                    '''Create an account''',
                    style: AppTextStyles.headerSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  Text(
                    '''Please complete your profile''',
                    style: AppTextStyles.subHeaderSignupTextStyle(context),
                  ),
                  SizedBox(height: AppSize.s90.h),
                  Fields(),
                ]);
              },
            ),
          ),
        ),
    );
  }
}
