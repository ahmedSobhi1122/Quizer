import 'package:flutter/material.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppPadding.defaultPadding,
            right: AppPadding.defaultPadding,
            bottom: context.height * 0.122),
        child: Container(
          width: context.width * 0.779,
          height: context.height * 0.0655,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.br24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ]),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.br24),
              ),
              side: const BorderSide(color: AppColors.purpleColor),
              backgroundColor: AppColors.lightPurpleColor.withOpacity(.7),
            ),
            onPressed: () {},
            child: Text(
              text,
              style: AppTextStyles.customButtonTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }
}
