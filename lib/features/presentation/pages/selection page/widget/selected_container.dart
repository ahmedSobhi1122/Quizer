import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/config/routes/screen_export.dart';
import 'package:quizer/core/constants/enum.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';

class SelectedContainer extends StatelessWidget {
  const SelectedContainer(
      {super.key,
      required this.color,
      required this.fillColor,
      required this.icon,
      required this.content});

  final Color color;
  final Color fillColor;

  final Icon icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s350.w,
      height: AppSize.s96.h,
      decoration: BoxDecoration(
        border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.blackColor.withOpacity(.4)),
        borderRadius: BorderRadius.circular(AppBorderRadius.br24.r),
        color: fillColor,
      ),
      child: Row(
        children: [
          Container(
            width: AppSize.s96.w,
            height: context.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppBorderRadius.br24.r),
                topLeft: Radius.circular(AppBorderRadius.br24.r),
              ),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p14.r),
              child: CircleAvatar(
                  backgroundColor: AppColors.blackColor.withOpacity(.25),
                  child: icon),
            ),
          ),
          SizedBox(
            width: AppSize.s20.w,
          ),
          Text(
            content,
            style: AppTextStyles.selectedBoxTextStyle(
                context,
                fillColor == AppColors.transparentColor
                    ? AppColors.blackColor
                    : AppColors.whiteColor),
          )
        ],
      ),
    );
  }
}

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  int isClicked = -1;
  Color _fillColor1 = AppColors.transparentColor;
  Color _fillColor2 = AppColors.transparentColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isClicked == 0) {
                isClicked = -1;
                _fillColor1 = AppColors.transparentColor;
                _fillColor2 = AppColors.transparentColor;
                context.read<RegisterCubit>().userRole = UserRole.ADMIN;
              } else {
                isClicked = 0;
                _fillColor1 = AppColors.purpleColor.withOpacity(.2);
                _fillColor2 = AppColors.transparentColor;
                context.read<RegisterCubit>().userRole = UserRole.STUDENT;
              }
            });
          },
          child: SelectedContainer(
            content: "Student",
            color: AppColors.purpleColor,
            icon: Icon(
              Icons.person,
              color: AppColors.whiteColor,
              size: AppSize.s36.r,
            ),
            fillColor: _fillColor1,
          ),
        ),
        SizedBox(height: AppSize.s32.h),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isClicked == 1) {
                isClicked = -1;
                _fillColor1 = AppColors.transparentColor;
                _fillColor2 = AppColors.transparentColor;
                context.read<RegisterCubit>().userRole = UserRole.ADMIN;
              } else {
                isClicked = 1;
                _fillColor1 = AppColors.transparentColor;
                _fillColor2 = AppColors.warningColor.withOpacity(.2);
                context.read<RegisterCubit>().userRole = UserRole.TEACHER;
              }
            });
          },
          child: SelectedContainer(
            content: "Teacher",
            color: AppColors.warningColor,
            icon: Icon(
              Icons.person,
              color: AppColors.whiteColor,
              size: AppSize.s36.r,
            ),
            fillColor: _fillColor2,
          ),
        )
      ],
    );
  }
}
