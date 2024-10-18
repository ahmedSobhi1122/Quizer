
import 'package:flutter/material.dart';
import 'package:quizer/config/themes/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_button_with_shadow.dart';



class QuestionButtons extends StatelessWidget {
  final VoidCallback onAddMore;
  final VoidCallback onFinish;

  const QuestionButtons({
    Key? key,
    required this.onAddMore,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "Add More",
            onPressed: onAddMore,
            color: MyTheme.secondaryButtonColor,
            colorText: MyTheme.secondaryButtonTextColor,
          ),
        ),
        SizedBox(width: 50.w),
        Expanded(
          child: CustomButton(
            text: "Finish",
            onPressed: onFinish,
            color: MyTheme.primaryButtonColor,
            colorText: MyTheme.primaryButtonTextColor,
          ),
        ),
      ],
    );
  }
}

