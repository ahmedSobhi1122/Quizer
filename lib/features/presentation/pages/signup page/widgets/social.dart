import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:quizer/core/resources/text_styles.dart';
import 'package:quizer/features/presentation/cubit/register_cubit.dart';

class Social extends StatelessWidget {
  final void Function()? onTapFacebook;
  final void Function()? onTapGoogle;
  const Social({
    super.key, this.onTapFacebook, this.onTapGoogle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonSocial(
          text: "Login with Facebook",
          icon: SvgPicture.asset(SVGAssets.facebook),
          onTap: onTapFacebook?? () => context.read<RegisterCubit>().registerWithFacebook(),
        ),
        SizedBox(height: AppSize.s20.h),
        CustomButtonSocial(
          text: "Login with Google",
          icon: SvgPicture.asset(SVGAssets.google),
          onTap: onTapGoogle?? () => context.read<RegisterCubit>().registerWithGoogle(),
        ),
      ],
    );
  }
}

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget? icon;

  const CustomButtonSocial({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppPadding.p8.r),
        width: AppSize.s350.w,
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purpleColor30),
          borderRadius: BorderRadius.circular(AppSize.s10.r),
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            icon ?? const SizedBox.shrink(),
            SizedBox(width: AppSize.s50.w),
            Text(
              text,
              style: AppTextStyles.socialButtonTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
