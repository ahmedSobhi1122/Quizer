import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';

class Social extends StatelessWidget {
  const Social({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.read<RegisterCubit>().registerWithFacebook();
          },
          child: Container(
            padding: EdgeInsets.all(AppPadding.defaultPadding.r),
            width: AppSize.s66.w,
            height: AppSize.s66.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.purpleColor30),
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              color: AppColors.whiteColor,
            ),
            child: SvgPicture.asset(SVGAssets.facebook),
          ),
        ),
        SizedBox(
          width: AppSize.s120.w,
        ),
        InkWell(
          onTap: () {
            context.read<RegisterCubit>().registerWithGoogle();
          },
          child: Container(
            padding: EdgeInsets.all(AppPadding.defaultPadding.r),
            width: AppSize.s66.w,
            height: AppSize.s66.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.purpleColor30),
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              color: AppColors.whiteColor,
            ),
            child: SvgPicture.asset(SVGAssets.google),
          ),
        ),
      ],
    );
  }
}
