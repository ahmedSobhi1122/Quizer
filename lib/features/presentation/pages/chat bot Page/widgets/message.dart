import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/screen_export.dart';
import '../../../../../config/themes/theme.dart';
import '../../../../../core/resources/app_values.dart';

Widget buildMessageBubble(String message, bool isUserMessage) {
  return Align(
    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(

      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p14),
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8, horizontal: AppMargin.m12),
      decoration: BoxDecoration(
        color: isUserMessage ? MyTheme.backgroundColor1 : MyTheme.answersCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: isUserMessage ? Radius.circular(12.r) : Radius.zero,
          bottomRight: isUserMessage ? Radius.zero : Radius.circular(12.r),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isUserMessage ? MyTheme.primaryButtonTextColor : MyTheme.textColor,
          fontSize: AppSize.s16,
        ),
      ),
    ),
  );
}